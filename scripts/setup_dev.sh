#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display usage
show_usage() {
    echo "🚀 Flutter Development Environment Setup"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  install, add     Install git hooks and setup development environment"
    echo "  remove, uninstall Remove git hooks"
    echo "  status           Show current git hooks status"
    echo "  help, -h, --help Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                # Install git hooks (default)"
    echo "  $0 install        # Install git hooks"
    echo "  $0 remove         # Remove git hooks"
    echo "  $0 status         # Check git hooks status"
}

# Function to install git hooks
install_hooks() {
    echo -e "${BLUE}🚀 Setting up development environment...${NC}"
    echo ""

    # Check if .git directory exists
    if [ ! -d ".git" ]; then
        echo -e "${RED}❌ Error: Not a git repository. Please run this script from the project root.${NC}"
        exit 1
    fi

    # Check if pre-commit template exists
    if [ ! -f "scripts/pre-commit-template" ]; then
        echo -e "${RED}❌ Error: pre-commit-template not found in scripts directory.${NC}"
        exit 1
    fi

    # Create pre-commit hook
    echo -e "${YELLOW}📝 Setting up pre-commit hook...${NC}"
    cp scripts/pre-commit-template .git/hooks/pre-commit
    chmod +x .git/hooks/pre-commit

    echo -e "${GREEN}✅ Pre-commit hook installed successfully!${NC}"
    echo ""
    echo -e "${GREEN}🎉 Setup completed!${NC}"
    echo ""
    echo -e "${BLUE}📋 What's been configured:${NC}"
    echo "  ✅ Pre-commit hook that auto-formats code before each commit"
    echo "  ✅ CI/CD workflows that auto-format code on push"
    echo ""
    echo -e "${BLUE}💡 Usage:${NC}"
    echo "  • Run './scripts/fix_lint.sh' to manually fix and format code"
    echo "  • Code will be auto-formatted on every commit"
    echo "  • CI/CD will auto-format and commit changes on push"
    echo "  • Run './scripts/setup_dev.sh remove' to uninstall git hooks"
}

# Function to remove git hooks
remove_hooks() {
    echo -e "${YELLOW}🗑️ Removing git hooks...${NC}"
    echo ""

    # Check if .git directory exists
    if [ ! -d ".git" ]; then
        echo -e "${RED}❌ Error: Not a git repository. Please run this script from the project root.${NC}"
        exit 1
    fi

    # Remove pre-commit hook
    if [ -f ".git/hooks/pre-commit" ]; then
        rm .git/hooks/pre-commit
        echo -e "${GREEN}✅ Pre-commit hook removed successfully!${NC}"
    else
        echo -e "${YELLOW}⚠️ Pre-commit hook not found (already removed or never installed).${NC}"
    fi

    echo ""
    echo -e "${GREEN}🎉 Git hooks removal completed!${NC}"
    echo ""
    echo -e "${BLUE}💡 To reinstall git hooks, run: ./scripts/setup_dev.sh install${NC}"
}

# Function to show git hooks status
show_status() {
    echo -e "${BLUE}📊 Git Hooks Status${NC}"
    echo ""

    # Check if .git directory exists
    if [ ! -d ".git" ]; then
        echo -e "${RED}❌ Error: Not a git repository. Please run this script from the project root.${NC}"
        exit 1
    fi

    # Check pre-commit hook
    if [ -f ".git/hooks/pre-commit" ] && [ -x ".git/hooks/pre-commit" ]; then
        echo -e "${GREEN}✅ Pre-commit hook: Installed and executable${NC}"
    elif [ -f ".git/hooks/pre-commit" ]; then
        echo -e "${YELLOW}⚠️ Pre-commit hook: Installed but not executable${NC}"
    else
        echo -e "${RED}❌ Pre-commit hook: Not installed${NC}"
    fi

    # Check if template exists
    if [ -f "scripts/pre-commit-template" ]; then
        echo -e "${GREEN}✅ Pre-commit template: Available${NC}"
    else
        echo -e "${RED}❌ Pre-commit template: Missing${NC}"
    fi

    echo ""
    echo -e "${BLUE}💡 Available commands:${NC}"
    echo "  • ./scripts/setup_dev.sh install  - Install git hooks"
    echo "  • ./scripts/setup_dev.sh remove   - Remove git hooks"
}

# Main script logic
case "${1:-install}" in
    "install"|"add"|"")
        install_hooks
        ;;
    "remove"|"uninstall")
        remove_hooks
        ;;
    "status")
        show_status
        ;;
    "help"|"-h"|"--help")
        show_usage
        ;;
    *)
        echo -e "${RED}❌ Error: Unknown command '$1'${NC}"
        echo ""
        show_usage
        exit 1
        ;;
esac