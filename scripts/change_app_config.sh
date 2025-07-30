#!/bin/bash

# App Configuration Changer Script
# This script helps change app name and bundle ID for different flavors
# Usage: ./scripts/change_app_config.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Project paths
ANDROID_BUILD_GRADLE="android/app/build.gradle.kts"
IOS_DEVELOP_XCCONFIG="ios/Flutter/Develop.xcconfig"
IOS_PRODUCTION_XCCONFIG="ios/Flutter/Production.xcconfig"
MACOS_APPINFO_XCCONFIG="macos/Runner/Configs/AppInfo.xcconfig"
ENV_DEV="assets/env/.env.dev"
ENV_PRODUCTION="assets/env/.env.production"
ENV_DEFAULT="assets/env/.env"

# Current configurations
DEVELOP_DISPLAY_NAME="Base Dev"
DEVELOP_BUNDLE_ID="com.stormx.base.dev"
PRODUCTION_DISPLAY_NAME="Base"
PRODUCTION_BUNDLE_ID="com.stormx.base"

# Function to print colored output
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_header() {
    echo -e "${BLUE}🚀 App Configuration Changer${NC}"
    echo -e "${BLUE}=============================${NC}"
}

# Function to show help
show_help() {
    print_header
    echo ""
    echo "Usage: ./scripts/change_app_config.sh [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help              Show this help message"
    echo "  -f, --flavor FLAVOR     Update specific flavor (develop|production)"
    echo "  -n, --name NAME         Set app display name"
    echo "  -b, --bundle-id ID      Set bundle identifier"
    echo "  -a, --all               Update all flavors interactively"
    echo "  -s, --show              Show current configuration"
    echo ""
    echo "Examples:"
    echo "  ./scripts/change_app_config.sh -f develop -n \"My App Dev\" -b \"com.example.myapp.dev\""
    echo "  ./scripts/change_app_config.sh -f production -n \"My App\" -b \"com.example.myapp\""
    echo "  ./scripts/change_app_config.sh -a"
    echo "  ./scripts/change_app_config.sh -s"
    echo ""
    echo "Current Configuration:"
    echo "  develop:"
    echo "    Display Name: $DEVELOP_DISPLAY_NAME"
    echo "    Bundle ID: $DEVELOP_BUNDLE_ID"
    echo ""
    echo "  production:"
    echo "    Display Name: $PRODUCTION_DISPLAY_NAME"
    echo "    Bundle ID: $PRODUCTION_BUNDLE_ID"
}

# Function to show current configuration
show_current_config() {
    print_header
    echo ""
    echo "📱 Current App Configuration:"
    echo "============================="
    echo ""
    echo "DEVELOP Flavor:"
    echo "  Display Name: $DEVELOP_DISPLAY_NAME"
    echo "  Bundle ID: $DEVELOP_BUNDLE_ID"
    echo "  Android App ID: $DEVELOP_BUNDLE_ID"
    echo ""
    echo "PRODUCTION Flavor:"
    echo "  Display Name: $PRODUCTION_DISPLAY_NAME"
    echo "  Bundle ID: $PRODUCTION_BUNDLE_ID"
    echo "  Android App ID: $PRODUCTION_BUNDLE_ID"
}

# Function to validate bundle ID format
validate_bundle_id() {
    local bundle_id="$1"
    if [[ ! "$bundle_id" =~ ^[a-zA-Z][a-zA-Z0-9]*(\.[a-zA-Z][a-zA-Z0-9]*)+$ ]]; then
        print_error "Invalid bundle ID format: $bundle_id"
        print_info "Bundle ID should follow the format: com.company.appname"
        return 1
    fi
    return 0
}



# Function to update Android configuration
update_android_config() {
    local flavor="$1"
    local display_name="$2"
    local bundle_id="$3"
    
    print_info "Updating Android configuration for $flavor..."
    
    if [[ ! -f "$ANDROID_BUILD_GRADLE" ]]; then
        print_error "Android build.gradle.kts not found at $ANDROID_BUILD_GRADLE"
        return 1
    fi
    
    # Create temporary file for sed operations
    local temp_file=$(mktemp)
    
    if [[ "$flavor" == "develop" ]]; then
        # Update develop flavor configuration
        sed '/create("develop") {/,/}/ {
            s/resValue("string", "app_name", "[^"]*")/resValue("string", "app_name", "'"$display_name"'")/
        }' "$ANDROID_BUILD_GRADLE" > "$temp_file"
    elif [[ "$flavor" == "production" ]]; then
        # Update production flavor configuration and default applicationId
        sed -e '/create("production") {/,/}/ {
            s/resValue("string", "app_name", "[^"]*")/resValue("string", "app_name", "'"$display_name"'")/
        }' \
        -e 's/applicationId = "[^"]*"/applicationId = "'"$bundle_id"'"/' \
        -e 's/namespace = "[^"]*"/namespace = "'"$bundle_id"'"/' \
        "$ANDROID_BUILD_GRADLE" > "$temp_file"
    fi
    
    mv "$temp_file" "$ANDROID_BUILD_GRADLE"
    print_success "Updated Android configuration"
}

# Function to update iOS configuration
update_ios_config() {
    local flavor="$1"
    local display_name="$2"
    local bundle_id="$3"
    
    print_info "Updating iOS configuration for $flavor..."
    
    local xcconfig_file
    if [[ "$flavor" == "develop" ]]; then
        xcconfig_file="$IOS_DEVELOP_XCCONFIG"
    else
        xcconfig_file="$IOS_PRODUCTION_XCCONFIG"
    fi
    
    if [[ ! -f "$xcconfig_file" ]]; then
        print_error "iOS xcconfig file not found at $xcconfig_file"
        return 1
    fi
    
    # Update PRODUCT_BUNDLE_IDENTIFIER and PRODUCT_NAME
    sed -i '' \
        -e "s/PRODUCT_BUNDLE_IDENTIFIER = .*/PRODUCT_BUNDLE_IDENTIFIER = $bundle_id/" \
        -e "s/PRODUCT_NAME = .*/PRODUCT_NAME = $display_name/" \
        "$xcconfig_file"
    
    print_success "Updated iOS configuration for $flavor"
}

# Function to update macOS configuration (only for production)
update_macos_config() {
    local display_name="$1"
    local bundle_id="$2"
    
    print_info "Updating macOS configuration..."
    
    if [[ ! -f "$MACOS_APPINFO_XCCONFIG" ]]; then
        print_warning "macOS AppInfo.xcconfig not found at $MACOS_APPINFO_XCCONFIG, skipping..."
        return 0
    fi
    
    # Update PRODUCT_NAME and PRODUCT_BUNDLE_IDENTIFIER
    sed -i '' \
        -e "s/PRODUCT_NAME = .*/PRODUCT_NAME = $display_name/" \
        -e "s/PRODUCT_BUNDLE_IDENTIFIER = .*/PRODUCT_BUNDLE_IDENTIFIER = $bundle_id/" \
        "$MACOS_APPINFO_XCCONFIG"
    
    print_success "Updated macOS configuration"
}

# Function to update environment files
update_env_files() {
    local flavor="$1"
    local display_name="$2"
    
    print_info "Updating environment files for $flavor..."
    
    local env_file
    if [[ "$flavor" == "develop" ]]; then
        env_file="$ENV_DEV"
    else
        env_file="$ENV_PRODUCTION"
    fi
    
    if [[ -f "$env_file" ]]; then
        sed -i '' "s/APP_NAME=.*/APP_NAME=$display_name/" "$env_file"
        print_success "Updated $env_file"
    else
        print_warning "Environment file not found at $env_file, skipping..."
    fi
    
    # Also update default env file if this is production
    if [[ "$flavor" == "production" && -f "$ENV_DEFAULT" ]]; then
        sed -i '' "s/APP_NAME=.*/APP_NAME=$display_name/" "$ENV_DEFAULT"
        print_success "Updated default environment file"
    fi
}

# Function to apply changes for a specific flavor
apply_changes() {
    local flavor="$1"
    local display_name="$2"
    local bundle_id="$3"
    
    print_info "Applying changes for $flavor flavor..."
    echo "  Display Name: $display_name"
    echo "  Bundle ID: $bundle_id"
    echo ""
    
    # Validate bundle ID
    if ! validate_bundle_id "$bundle_id"; then
        return 1
    fi
    
    # Update configurations
    update_android_config "$flavor" "$display_name" "$bundle_id"
    update_ios_config "$flavor" "$display_name" "$bundle_id"
    
    # Update macOS configuration only for production
    if [[ "$flavor" == "production" ]]; then
        update_macos_config "$display_name" "$bundle_id"
    fi
    
    update_env_files "$flavor" "$display_name"
    
    print_success "$flavor flavor updated successfully!"
}

# Function for interactive mode
interactive_mode() {
    print_header
    echo ""
    echo "Select operation:"
    echo "1. Update specific flavor"
    echo "2. Update all flavors"
    echo "3. Show current configuration"
    echo "4. Exit"
    echo ""
    read -p "Enter your choice (1-4): " choice
    
    case $choice in
        1)
            interactive_update_specific_flavor
            ;;
        2)
            interactive_update_all_flavors
            ;;
        3)
            show_current_config
            ;;
        4)
            echo "👋 Goodbye!"
            ;;
        *)
            print_error "Invalid choice. Please try again."
            interactive_mode
            ;;
    esac
}

# Function for interactive specific flavor update
interactive_update_specific_flavor() {
    echo ""
    echo "Available flavors:"
    echo "1. develop"
    echo "2. production"
    echo ""
    read -p "Select flavor (1-2): " flavor_choice
    
    local flavor
    case $flavor_choice in
        1)
            flavor="develop"
            ;;
        2)
            flavor="production"
            ;;
        *)
            print_error "Invalid flavor choice."
            return 1
            ;;
    esac
    
    local current_display_name current_bundle_id
    if [[ "$flavor" == "develop" ]]; then
        current_display_name="$DEVELOP_DISPLAY_NAME"
        current_bundle_id="$DEVELOP_BUNDLE_ID"
    else
        current_display_name="$PRODUCTION_DISPLAY_NAME"
        current_bundle_id="$PRODUCTION_BUNDLE_ID"
    fi
    
    echo ""
    echo "Current configuration for $flavor:"
    echo "  Display Name: $current_display_name"
    echo "  Bundle ID: $current_bundle_id"
    echo ""
    
    read -p "Enter new app display name (or press Enter to keep current): " new_display_name
    if [[ -z "$new_display_name" ]]; then
        new_display_name="$current_display_name"
    fi
    
    read -p "Enter new bundle ID (or press Enter to keep current): " new_bundle_id
    if [[ -z "$new_bundle_id" ]]; then
        new_bundle_id="$current_bundle_id"
    fi
    
    echo ""
    echo "📋 Summary of changes:"
    echo "  Flavor: $flavor"
    echo "  Display Name: $current_display_name → $new_display_name"
    echo "  Bundle ID: $current_bundle_id → $new_bundle_id"
    echo ""
    
    read -p "Proceed with changes? (y/N): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        apply_changes "$flavor" "$new_display_name" "$new_bundle_id"
    else
        print_warning "Changes cancelled."
    fi
}

# Function for interactive all flavors update
interactive_update_all_flavors() {
    echo ""
    print_info "Updating all flavors..."
    
    # Collect new configurations
    declare -A new_display_names
    declare -A new_bundle_ids
    
    for flavor in "develop" "production"; do
        local current_display_name current_bundle_id
        if [[ "$flavor" == "develop" ]]; then
            current_display_name="$DEVELOP_DISPLAY_NAME"
            current_bundle_id="$DEVELOP_BUNDLE_ID"
        else
            current_display_name="$PRODUCTION_DISPLAY_NAME"
            current_bundle_id="$PRODUCTION_BUNDLE_ID"
        fi
        
        echo ""
        echo "--- Configuring $flavor flavor ---"
        echo "Current configuration:"
        echo "  Display Name: $current_display_name"
        echo "  Bundle ID: $current_bundle_id"
        
        read -p "Enter new app display name (or press Enter to keep current): " new_display_name
        if [[ -z "$new_display_name" ]]; then
            new_display_name="$current_display_name"
        fi
        
        read -p "Enter new bundle ID (or press Enter to keep current): " new_bundle_id
        if [[ -z "$new_bundle_id" ]]; then
            new_bundle_id="$current_bundle_id"
        fi
        
        new_display_names[$flavor]="$new_display_name"
        new_bundle_ids[$flavor]="$new_bundle_id"
    done
    
    echo ""
    echo "📋 Summary of all changes:"
    for flavor in "develop" "production"; do
        local current_display_name current_bundle_id
        if [[ "$flavor" == "develop" ]]; then
            current_display_name="$DEVELOP_DISPLAY_NAME"
            current_bundle_id="$DEVELOP_BUNDLE_ID"
        else
            current_display_name="$PRODUCTION_DISPLAY_NAME"
            current_bundle_id="$PRODUCTION_BUNDLE_ID"
        fi
        
        echo "  $flavor:"
        echo "    Display Name: $current_display_name → ${new_display_names[$flavor]}"
        echo "    Bundle ID: $current_bundle_id → ${new_bundle_ids[$flavor]}"
    done
    
    echo ""
    read -p "Proceed with all changes? (y/N): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        for flavor in "develop" "production"; do
            apply_changes "$flavor" "${new_display_names[$flavor]}" "${new_bundle_ids[$flavor]}"
        done
        print_success "All changes applied successfully!"
    else
        print_warning "Changes cancelled."
    fi
}

# Main script logic
main() {
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -f|--flavor)
                FLAVOR="$2"
                shift 2
                ;;
            -n|--name)
                DISPLAY_NAME="$2"
                shift 2
                ;;
            -b|--bundle-id)
                BUNDLE_ID="$2"
                shift 2
                ;;
            -a|--all)
                ALL_FLAVORS=true
                shift
                ;;
            -s|--show)
                show_current_config
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    # Check if we're in the right directory
    if [[ ! -f "pubspec.yaml" ]]; then
        print_error "This script must be run from the Flutter project root directory."
        exit 1
    fi
    
    # Handle different modes
    if [[ "$ALL_FLAVORS" == true ]]; then
        interactive_update_all_flavors
    elif [[ -n "$FLAVOR" ]]; then
        # Command line mode
        if [[ "$FLAVOR" != "develop" && "$FLAVOR" != "production" ]]; then
            print_error "Invalid flavor: $FLAVOR. Must be 'develop' or 'production'."
            exit 1
        fi
        
        if [[ -z "$DISPLAY_NAME" || -z "$BUNDLE_ID" ]]; then
            print_error "Both --name and --bundle-id are required when using --flavor."
            show_help
            exit 1
        fi
        
        apply_changes "$FLAVOR" "$DISPLAY_NAME" "$BUNDLE_ID"
    else
        # Interactive mode
        interactive_mode
    fi
}

# Run the main function
main "$@"