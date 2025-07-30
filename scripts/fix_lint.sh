#!/bin/bash

echo "🚀 Starting comprehensive code fix and format process..."

# Step 1: Apply dart fix
echo "🛠️ Applying dart fix..."
if fvm dart fix --apply; then
    echo "✅ Dart fix completed successfully"
else
    echo "❌ Dart fix failed"
    exit 1
fi

# Step 2: Format code
echo "📝 Formatting code..."
if fvm dart format lib/ test/; then
    echo "✅ Code formatting completed successfully"
else
    echo "❌ Code formatting failed"
    exit 1
fi

# Step 3: Run analysis to check for any remaining issues
echo "🔍 Running static analysis..."
if fvm flutter analyze --fatal-warnings; then
    echo "✅ Static analysis passed"
else
    echo "❌ Static analysis failed - please fix the remaining issues manually"
    exit 1
fi

echo "🎉 All code quality fixes completed successfully!"
echo "Your code is now properly formatted and ready for commit."