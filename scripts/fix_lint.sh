#!/bin/bash

# Script to fix common lint issues automatically
echo "🔧 Fixing lint issues..."

# Step 1: Run dart fix --apply
echo "🛠️  Step 1: Running dart fix --apply..."
fvm dart fix --apply

if [ $? -eq 0 ]; then
    echo "✅ Dart fix completed successfully"
else
    echo "❌ Dart fix failed"
    exit 1
fi

# Step 2: Format code
echo "📝 Step 2: Formatting code..."
fvm dart format lib/ test/

if [ $? -eq 0 ]; then
    echo "✅ Code formatting completed successfully"
else
    echo "❌ Code formatting failed"
    exit 1
fi

# Step 3: Run analyze to check remaining issues
echo "🔍 Step 3: Checking for lint issues..."
fvm flutter analyze --fatal-warnings

if [ $? -eq 0 ]; then
    echo "✅ All lint checks passed! Your code is ready for commit."
else
    echo "❌ Some lint issues still remain. Please fix them manually."
    echo "💡 Common fixes:"
    echo "   - Move constructors to the top of classes"
    echo "   - Use const constructors where possible"
    echo "   - Remove unused imports and variables"
    echo "   - Add return types to functions"
    echo "   - Fix any remaining analyzer warnings"
fi