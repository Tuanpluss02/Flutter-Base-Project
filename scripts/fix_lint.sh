#!/bin/bash

# Script to fix common lint issues automatically
echo "🔧 Fixing lint issues..."

# Format code
echo "📝 Formatting code..."
fvm dart format lib/ test/

# Fix imports
echo "📦 Organizing imports..."
fvm dart fix --apply

# Run analyze to check remaining issues
echo "🔍 Checking for remaining issues..."
fvm flutter analyze --fatal-warnings

if [ $? -eq 0 ]; then
    echo "✅ All lint issues fixed!"
else
    echo "❌ Some issues still remain. Please fix them manually."
    echo "💡 Common fixes:"
    echo "   - Move constructors to the top of classes"
    echo "   - Use const constructors where possible"
    echo "   - Remove unused imports and variables"
    echo "   - Add return types to functions"
fi