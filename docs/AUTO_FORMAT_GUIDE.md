# Auto-Format Setup 

### 1. Pre-commit Hook 
Automatically format code before each commit:

#### Installation
```bash
# Install pre-commit hook (default)
./scripts/setup_dev.sh

# Alternative installation commands
./scripts/setup_dev.sh install
./scripts/setup_dev.sh add
```

#### Management Commands
```bash
# Check git hooks status
./scripts/setup_dev.sh status

# Remove git hooks
./scripts/setup_dev.sh remove
./scripts/setup_dev.sh uninstall

# Show help and available commands
./scripts/setup_dev.sh help
```

**How it works:**
- Automatically runs `dart fix --apply` and `dart format` before each commit
- Only formats staged Dart files
- Automatically re-adds formatted files to staging area
- Fails commit if static analysis errors exist
- Provides colored output for better user experience

### 2. CI/CD Auto-Format (GitHub Actions & GitLab CI)
Automatically format code when pushing to repository:

**GitHub Actions:** `.github/workflows/auto-format.yaml`
**GitLab CI:** `.gitlab-ci.yml` (stage: auto-format)

**How it works:**
- Runs on branches: `develop`, `feature/*`, `bugfix/*`, `hotfix/*`
- Automatically formats code and commits back with message `🤖 Auto-format`
- Uses `[skip ci]` to avoid infinite loops
- Runs before code-quality stage

### 3. Manual Script
Format code manually when needed:

```bash
# Format entire project
./scripts/fix_lint.sh
```

## 🔧 Configuration

### GitHub Actions
Configure permissions in repository settings:
- `Settings` → `Actions` → `General` → `Workflow permissions`
- Select "Read and write permissions"

### GitLab CI
Create CI/CD variable:
- `Settings` → `CI/CD` → `Variables`
- Create variable `CI_PUSH_TOKEN` with Personal Access Token having `write_repository` permission

## Workflow Process

### Local Development
1. Developer writes code
2. `git add .`
3. `git commit -m "message"` 
4. Pre-commit hook automatically formats and re-adds files
5. Commit succeeds with formatted code

### CI/CD Pipeline
1. Developer pushes code
2. Auto-format stage runs and formats code
3. If changes detected → commits back with `[skip ci]`
4. Code-quality stage runs to verify
5. Pipeline passes if no errors

## Important Notes

1. **Pre-commit hook** only works on machines where it's installed
2. **CI/CD auto-format** requires write permissions to repository
3. Use `[skip ci]` to avoid triggering unnecessary pipelines
4. If merge conflicts occur, may need to format manually

## 🛠️ Troubleshooting

### Pre-commit hook not working
```bash
# Check git hooks status
./scripts/setup_dev.sh status

# Check if file exists and is executable
ls -la .git/hooks/pre-commit

# Reinstall git hooks
./scripts/setup_dev.sh install

# Or remove and reinstall
./scripts/setup_dev.sh remove
./scripts/setup_dev.sh install
```

### Completely remove git hooks
```bash
# Remove all git hooks
./scripts/setup_dev.sh remove

# Verify removal
./scripts/setup_dev.sh status
```

### CI/CD cannot push
- Check permissions/token
- Review auto-format stage logs
- Ensure branch is not protected

### Formatting not working
```bash
# Run manual formatting to debug
./scripts/fix_lint.sh

# Check if FVM is properly configured
fvm flutter --version

# Verify Flutter analyze works
fvm flutter analyze
```

### Git hook template missing
```bash
# Check if template exists
ls -la scripts/pre-commit-template

# If missing, the setup script will show an error
./scripts/setup_dev.sh install
```