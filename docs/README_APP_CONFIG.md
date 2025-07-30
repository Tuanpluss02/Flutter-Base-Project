# App Configuration Changer

A comprehensive script to change app names and bundle IDs for different flavors in your Flutter project.

## Features

- ✅ **Multi-platform support**: Updates Android, iOS, and macOS configurations
- ✅ **Flavor-aware**: Handles both `develop` and `production` flavors
- ✅ **Interactive mode**: User-friendly prompts for easy configuration
- ✅ **Command-line mode**: Scriptable for CI/CD pipelines
- ✅ **Validation**: Validates bundle ID format
- ✅ **Environment files**: Updates `.env` files with new app names

## Usage

### Interactive Mode

Run the script without arguments for an interactive experience:

```bash
./scripts/change_app_config.sh
```

### Command Line Mode

Update a specific flavor with command line arguments:

```bash
# Update develop flavor
./scripts/change_app_config.sh -f develop -n "My App Dev" -b "com.example.myapp.dev"

# Update production flavor
./scripts/change_app_config.sh -f production -n "My App" -b "com.example.myapp"
```

### Update All Flavors

Update all flavors interactively:

```bash
./scripts/change_app_config.sh -a
```

### Show Current Configuration

Display the current app configuration:

```bash
./scripts/change_app_config.sh -s
```

## Command Line Options

| Option | Description |
|--------|-------------|
| `-h, --help` | Show help message |
| `-f, --flavor FLAVOR` | Update specific flavor (`develop` or `production`) |
| `-n, --name NAME` | Set app display name |
| `-b, --bundle-id ID` | Set bundle identifier |
| `-a, --all` | Update all flavors interactively |
| `-s, --show` | Show current configuration |

## What Gets Updated

### Android (`android/app/build.gradle.kts`)
- App name in `productFlavors` configuration
- Default `applicationId` and `namespace` (for production)

### iOS (`ios/Flutter/*.xcconfig`)
- `PRODUCT_NAME` (app display name)
- `PRODUCT_BUNDLE_IDENTIFIER` (bundle ID)

### macOS (`macos/Runner/Configs/AppInfo.xcconfig`)
- `PRODUCT_NAME` (app display name)
- `PRODUCT_BUNDLE_IDENTIFIER` (bundle ID)
- Only updated for production flavor

### Environment Files
- `assets/env/.env.dev` - Development environment
- `assets/env/.env.production` - Production environment
- `assets/env/.env` - Default environment (production only)

## Bundle ID Format

Bundle IDs must follow the reverse domain name format:
- ✅ `com.company.appname`
- ✅ `com.company.appname.dev`
- ❌ `invalid-bundle-id`
- ❌ `123.invalid`

## Examples

### Example 1: Update Development Flavor
```bash
./scripts/change_app_config.sh -f develop -n "MyApp Dev" -b "com.mycompany.myapp.dev"
```

### Example 2: Update Production Flavor
```bash
./scripts/change_app_config.sh -f production -n "MyApp" -b "com.mycompany.myapp"
```

### Example 3: Interactive Update
```bash
./scripts/change_app_config.sh
# Follow the prompts to update configurations
```

## Troubleshooting

### Script Must Be Run from Project Root
Make sure you're in the Flutter project root directory (where `pubspec.yaml` exists).

### File Not Found Errors
The script will warn you if certain files are missing and skip them safely.

### Bundle ID Validation Errors
Ensure your bundle ID follows the correct format: `com.company.appname`

## Integration with CI/CD

You can use this script in your CI/CD pipeline:

```yaml
# Example GitHub Actions step
- name: Update app configuration
  run: |
    ./scripts/change_app_config.sh -f production -n "MyApp" -b "com.mycompany.myapp"
```

## Current Default Configuration

- **Develop Flavor**:
  - Display Name: `Base Dev`
  - Bundle ID: `com.stormx.base.dev`

- **Production Flavor**:
  - Display Name: `Base`
  - Bundle ID: `com.stormx.base`