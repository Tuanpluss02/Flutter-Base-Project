# Flutter Lint Configuration Guide

## CI/CD Configuration

### GitHub Actions

The GitHub Actions workflow (`.github/workflows/lint.yaml`) runs **3 separate jobs**:

1. **dart-fix**: Checks for auto-fixable issues
   ```bash
   dart fix --apply
   ```

2. **dart-format**: Checks code formatting
   ```bash
   dart format --set-exit-if-changed lib/
   ```

3. **lint-check**: Runs static analysis (depends on the first two jobs)
   ```bash
   flutter analyze --fatal-warnings
   ```

### GitLab CI

The GitLab CI configuration (`.gitlab-ci.yml`) has **3 stages**:

1. **dart-fix stage**: Auto-fix validation
2. **dart-format stage**: Format validation  
3. **lint-check stage**: Static analysis

Both CI systems will **fail** if:
- Code has auto-fixable issues that haven't been applied
- Code is not properly formatted
- There are any analyzer warnings or errors

## Lint Rules

Our `analysis_options.yaml` includes:

### Promoted to Errors
- `avoid_print`
- `prefer_single_quotes`
- `unused_import`
- `unused_local_variable`
- `dead_code`
- `missing_return`
- `invalid_assignment`

## Usage

### Local Development

#### Quick Fix Script
```bash
./scripts/fix_lint.sh
```

This script runs all 3 steps in order:
1. `dart fix --apply` - Auto-fix issues
2. `dart format lib/ test/` - Format code
3. `flutter analyze --fatal-warnings` - Check for remaining issues

#### Manual Commands

**Step 1: Auto-fix issues**
```bash
fvm dart fix --apply
```

**Step 2: Format code**
```bash
fvm dart format lib/ test/
```

**Step 3: Check for lint issues**
```bash
fvm flutter analyze --fatal-warnings
```

#### Format Check Only
```bash
fvm dart format --set-exit-if-changed lib/
```

**Note**: `--set-exit-if-changed` will exit with code 1 if files need formatting. This is normal behavior and used by CI to detect unformatted code.

## Common Issues and Fixes

### Auto-fixable Issues
- **Unused imports**: Automatically removed by `dart fix --apply`
- **Prefer single quotes**: Automatically fixed
- **Missing const**: Automatically added where possible

### Manual Fixes Required
- **Constructor ordering**: Move constructors to the top of classes
- **Missing return types**: Add explicit return types to functions
- **Dead code**: Remove unreachable code
- **Complex logic**: Simplify overly complex expressions

### Format Issues
- **Inconsistent spacing**: Fixed by `dart format`
- **Line length**: Automatically wrapped by formatter
- **Indentation**: Standardized by formatter

## Developer Workflow

### Before Creating MR/PR

1. **Run the fix script**:
   ```bash
   ./scripts/fix_lint.sh
   ```

2. **Commit any changes**:
   ```bash
   git add .
   git commit -m "Fix lint issues"
   ```

3. **Push your changes**:
   ```bash
   git push
   ```

### If CI Fails

#### Dart Fix Issues
```bash
fvm dart fix --apply
git add .
git commit -m "Apply dart fix"
git push
```

#### Format Issues
```bash
fvm dart format lib/ test/
git add .
git commit -m "Format code"
git push
```

#### Lint Issues
Check the CI output for specific errors and fix them manually, then:
```bash
git add .
git commit -m "Fix lint issues"
git push
```

## Troubleshooting

### "dart format --set-exit-if-changed" exits with code 1
This is **expected behavior** when files need formatting. The CI uses this to detect unformatted code.

**Solution**: Run `fvm dart format lib/ test/` to format the code.

### CI fails on dart-fix stage
This means your code has auto-fixable issues.

**Solution**: Run `fvm dart fix --apply` locally and commit the changes.

### CI fails on lint-check stage
This means there are analyzer warnings or errors.

**Solution**: 
1. Run `fvm flutter analyze --fatal-warnings` locally
2. Fix the reported issues manually
3. Commit and push the fixes

### Permission denied on fix_lint.sh
**Solution**: Make the script executable:
```bash
chmod +x scripts/fix_lint.sh
```

## Pipeline Stages

The CI pipeline runs in this order:

1. **dart-fix** ➜ Validates no auto-fixable issues remain
2. **dart-format** ➜ Validates code formatting (runs in parallel with dart-fix)
3. **lint-check** ➜ Validates no analyzer warnings (runs after both previous stages pass)

This ensures code quality at multiple levels and provides clear feedback on what needs to be fixed.