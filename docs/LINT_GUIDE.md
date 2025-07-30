# Flutter Lint Configuration Guide

## CI/CD Configuration

### GitHub Actions

The GitHub Actions workflow (`.github/workflows/lint.yaml`) runs a **single optimized job** with **sequential steps**:

**Job: `code-quality`**
1. **Check auto-fixable issues**: `dart fix --apply`
2. **Check code formatting**: `dart format --set-exit-if-changed lib/`
3. **Run static analysis**: `flutter analyze --fatal-warnings`
4. **Success confirmation**

### GitLab CI

The GitLab CI configuration (`.gitlab-ci.yml`) uses the **same optimized approach**:

**Stage: `code-quality`**
- Single job with sequential execution
- Fast-fail on first error
- Clear step-by-step feedback

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

The CI will show exactly which step failed with clear emoji indicators:

#### 🛠️ Auto-fix Issues
```bash
fvm dart fix --apply
git add .
git commit -m "Apply dart fix"
git push
```

#### 📝 Format Issues
```bash
fvm dart format lib/ test/
git add .
git commit -m "Format code"
git push
```

#### 🔍 Lint Issues
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

### CI fails on auto-fix step (🛠️)
This means your code has auto-fixable issues.

**Solution**: Run `fvm dart fix --apply` locally and commit the changes.

### CI fails on format step (📝)
This means your code is not properly formatted.

**Solution**: Run `fvm dart format lib/ test/` locally and commit the changes.

### CI fails on analysis step (🔍)
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