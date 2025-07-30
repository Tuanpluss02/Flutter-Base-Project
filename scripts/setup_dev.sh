#!/bin/bash

echo "🚀 Setting up development environment..."

# Create pre-commit hook
echo "📝 Setting up pre-commit hook..."
cp scripts/pre-commit-template .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "✅ Pre-commit hook installed successfully!"
echo ""
echo "🎉 Setup completed!"
echo ""
echo "📋 What's been configured:"
echo "  ✅ Pre-commit hook that auto-formats code before each commit"
echo "  ✅ CI/CD workflows that auto-format code on push"
echo ""
echo "💡 Usage:"
echo "  • Run './scripts/fix_lint.sh' to manually fix and format code"
echo "  • Code will be auto-formatted on every commit"
echo "  • CI/CD will auto-format and commit changes on push"