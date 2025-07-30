# Linting Guide

This guide explains the linting configuration, rules, and best practices for maintaining code quality in the Flutter Base Project.

## Overview

The project uses **flutter_lints** as the foundation for code analysis, with additional custom rules to enforce coding standards and best practices.

## Configuration

### Analysis Options (`analysis_options.yaml`)

The linting configuration is defined in `analysis_options.yaml`:

```yaml
include: package:flutter_lints/flutter.yaml

analyzer:
  exclude:
    - '**/*.g.dart'
    - '**/*.freezed.dart'
    - '**/*.mocks.dart'
  errors:
    # Treat these as errors instead of warnings
    avoid_print: error
    prefer_single_quotes: error
    unused_import: error
    unused_local_variable: error
    dead_code: error
    # Make all warnings fatal in CI
    missing_return: error
    invalid_assignment: error

linter:
  rules:
    # Additional strict rules
    always_declare_return_types: true
    always_put_required_named_parameters_first: true
    always_use_package_imports: true
    avoid_empty_else: true
    avoid_print: true
    avoid_returning_null_for_void: true
    avoid_slow_async_io: true
    avoid_unnecessary_containers: true
    avoid_web_libraries_in_flutter: true
    cancel_subscriptions: true
    close_sinks: true
    comment_references: true
    control_flow_in_finally: true
    empty_catches: true
    empty_constructor_bodies: true
    empty_statements: true
    hash_and_equals: true
    implementation_imports: true
    invariant_booleans: true
    iterable_contains_unrelated_type: true
    list_remove_unrelated_type: true
    literal_only_boolean_expressions: true
    no_adjacent_strings_in_list: true
    no_duplicate_case_values: true
    no_logic_in_create_state: true
    prefer_collection_literals: true
    prefer_conditional_assignment: true
    prefer_const_constructors: true
    prefer_const_constructors_in_immutables: true
    prefer_const_declarations: true
    prefer_const_literals_to_create_immutables: true
    prefer_final_fields: true
    prefer_final_in_for_each: true
    prefer_final_locals: true
    prefer_for_elements_to_map_fromIterable: true
    prefer_function_declarations_over_variables: true
    prefer_if_null_operators: true
    prefer_initializing_formals: true
    prefer_inlined_adds: true
    prefer_is_empty: true
    prefer_is_not_empty: true
    prefer_null_aware_operators: true
    prefer_single_quotes: true
    prefer_spread_collections: true
    prefer_typing_uninitialized_variables: true
    provide_deprecation_message: true
    sized_box_for_whitespace: true
    slash_for_doc_comments: true
    sort_child_properties_last: true
    sort_constructors_first: true
    sort_unnamed_constructors_first: true
    test_types_in_equals: true
    throw_in_finally: true
    unnecessary_brace_in_string_interps: true
    unnecessary_const: true
    unnecessary_getters_setters: true
    unnecessary_new: true
    unnecessary_null_aware_assignments: true
    unnecessary_null_in_if_null_operators: true
    unnecessary_overrides: true
    unnecessary_parenthesis: true
    unnecessary_statements: true
    unnecessary_string_interpolations: true
    unnecessary_this: true
    unrelated_type_equality_checks: true
    use_full_hex_values_for_flutter_colors: true
    use_function_type_syntax_for_parameters: true
    use_rethrow_when_possible: true
    valid_regexps: true
    void_checks: true
```

## Linting Rules Explained

### 1. Error Prevention Rules

#### `always_declare_return_types`
**Purpose**: Ensures all functions have explicit return types.

```dart
// Good
String getName() {
  return 'John';
}

Future<User> getUser() async {
  return User();
}

// Bad
getName() {  // Missing return type
  return 'John';
}
```

#### `avoid_returning_null_for_void`
**Purpose**: Prevents returning null in void functions.

```dart
// Good
void processData() {
  // Process data
  return; // or just don't return anything
}

// Bad
void processData() {
  return null; // Don't return null for void
}
```

#### `cancel_subscriptions`
**Purpose**: Ensures StreamSubscriptions are properly cancelled.

```dart
// Good
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late StreamSubscription _subscription;
  
  @override
  void initState() {
    super.initState();
    _subscription = stream.listen((data) {});
  }
  
  @override
  void dispose() {
    _subscription.cancel(); // Always cancel
    super.dispose();
  }
}
```

#### `close_sinks`
**Purpose**: Ensures StreamControllers and Sinks are properly closed.

```dart
// Good
class DataService {
  final StreamController<String> _controller = StreamController<String>();
  
  Stream<String> get stream => _controller.stream;
  
  void dispose() {
    _controller.close(); // Always close
  }
}
```

### 2. Style Rules

#### `prefer_const_constructors`
**Purpose**: Encourages using const constructors for better performance.

```dart
// Good
const Text('Hello World')
const SizedBox(height: 16)
const EdgeInsets.all(8)

// Bad
Text('Hello World')
SizedBox(height: 16)
EdgeInsets.all(8)
```

#### `prefer_const_declarations`
**Purpose**: Encourages using const for immutable values.

```dart
// Good
const String apiUrl = 'https://api.example.com';
const int maxRetries = 3;

// Bad
final String apiUrl = 'https://api.example.com';
final int maxRetries = 3;
```

#### `prefer_final_fields`
**Purpose**: Encourages using final for fields that don't change.

```dart
// Good
class UserService {
  final ApiClient _apiClient;
  final Logger _logger;
  
  UserService(this._apiClient, this._logger);
}

// Bad
class UserService {
  ApiClient _apiClient; // Should be final
  Logger _logger;       // Should be final
  
  UserService(this._apiClient, this._logger);
}
```

#### `prefer_single_quotes`
**Purpose**: Enforces consistent string quoting.

```dart
// Good
const String message = 'Hello World';
const String path = 'assets/images/logo.png';

// Bad
const String message = "Hello World";
const String path = "assets/images/logo.png";
```

### 3. Import and Usage Rules

#### `unused_import`
**Purpose**: Removes unused imports to keep code clean.

```dart
// Good
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(); // material.dart is used
  }
}

// Bad
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // Unused import

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

#### `unused_local_variable`
**Purpose**: Identifies unused variables.

```dart
// Good
void processData(List<String> items) {
  for (final item in items) {
    print(item); // item is used
  }
}

// Bad
void processData(List<String> items) {
  final count = items.length; // Unused variable
  for (final item in items) {
    print(item);
  }
}
```

#### `dead_code`
**Purpose**: Identifies unreachable code.

```dart
// Good
String getStatus(bool isActive) {
  if (isActive) {
    return 'Active';
  }
  return 'Inactive';
}

// Bad
String getStatus(bool isActive) {
  if (isActive) {
    return 'Active';
  } else {
    return 'Inactive';
  }
  print('This will never execute'); // Dead code
}
```

## Running Linting

### 1. Command Line

```bash
# Analyze entire project
fvm flutter analyze

# Analyze specific file
fvm flutter analyze lib/main.dart

# Analyze with verbose output
fvm flutter analyze --verbose

# Check for unused files
fvm dart analyze --unused-files
```

### 2. IDE Integration

#### VS Code
1. Install Flutter extension
2. Linting runs automatically
3. View problems in Problems panel
4. Use Ctrl+Shift+P → "Dart: Fix All"

#### Android Studio
1. Flutter plugin provides linting
2. View issues in Inspection Results
3. Use Alt+Enter for quick fixes

### 3. Pre-commit Hooks

Add to `.git/hooks/pre-commit`:

```bash
#!/bin/sh
echo "Running Flutter analyze..."
fvm flutter analyze

if [ $? -ne 0 ]; then
  echo "Flutter analyze failed. Please fix the issues before committing."
  exit 1
fi

echo "Running dart format..."
fvm dart format --set-exit-if-changed .

if [ $? -ne 0 ]; then
  echo "Code is not properly formatted. Please run 'dart format .' before committing."
  exit 1
fi
```

## Custom Linting Rules

### 1. Project-Specific Rules

You can add custom rules to `analysis_options.yaml`:

```yaml
linter:
  rules:
    # Naming conventions
    camel_case_types: true
    file_names: true
    non_constant_identifier_names: true
    
    # Documentation
    package_api_docs: true
    public_member_api_docs: false  # Disabled for this project
    
    # Design
    avoid_classes_with_only_static_members: true
    prefer_mixin: true
    
    # Pub
    sort_pub_dependencies: true
```

### 2. Suppressing Warnings

When necessary, you can suppress specific warnings:

```dart
// Suppress for entire file
// ignore_for_file: prefer_const_constructors

// Suppress for single line
Text('Hello') // ignore: prefer_const_constructors

// Suppress for next line
// ignore: prefer_const_constructors
Text('Hello')
```

## Common Linting Issues and Solutions

### 1. Prefer Const Constructors

**Issue**: Widget constructors should be const when possible.

```dart
// Problem
return Container(
  child: Text('Hello'),
);

// Solution
return const Container(
  child: Text('Hello'),
);
```

### 2. Unused Imports

**Issue**: Imported packages that aren't used.

```dart
// Problem
import 'package:dio/dio.dart'; // Not used
import 'package:flutter/material.dart';

// Solution - Remove unused import
import 'package:flutter/material.dart';
```

### 3. Missing Return Types

**Issue**: Functions without explicit return types.

```dart
// Problem
getUserName() {
  return 'John';
}

// Solution
String getUserName() {
  return 'John';
}
```

### 4. Prefer Final Fields

**Issue**: Fields that could be final aren't marked as such.

```dart
// Problem
class UserService {
  ApiClient _apiClient;
  
  UserService(this._apiClient);
}

// Solution
class UserService {
  final ApiClient _apiClient;
  
  UserService(this._apiClient);
}
```

## Linting in CI/CD

### GitHub Actions

```yaml
name: Code Quality
on: [push, pull_request]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.32.4'
      
      - name: Get dependencies
        run: flutter pub get
      
      - name: Generate code
        run: dart run build_runner build --delete-conflicting-outputs
      
      - name: Analyze code
        run: flutter analyze
      
      - name: Check formatting
        run: dart format --set-exit-if-changed .
```

### GitLab CI

```yaml
stages:
  - analyze

analyze:
  stage: analyze
  image: cirrusci/flutter:3.32.4
  script:
    - flutter pub get
    - dart run build_runner build --delete-conflicting-outputs
    - flutter analyze
    - dart format --set-exit-if-changed .
  only:
    - merge_requests
    - main
```

## Best Practices

### 1. Regular Analysis
- Run `flutter analyze` before committing
- Fix warnings, not just errors
- Use IDE linting features during development

### 2. Team Consistency
- Don't suppress warnings without good reason
- Discuss rule changes with the team
- Document any project-specific exceptions

### 3. Gradual Improvement
- Fix existing issues incrementally
- Add stricter rules over time
- Use `// TODO:` comments for planned improvements

### 4. Performance Impact
- Const constructors improve performance
- Final fields enable optimizations
- Proper resource disposal prevents memory leaks

## Troubleshooting

### 1. Analysis Server Issues

```bash
# Restart analysis server
# In VS Code: Ctrl+Shift+P → "Dart: Restart Analysis Server"

# Clear analysis cache
rm -rf .dart_tool/
flutter clean
flutter pub get
```

### 2. False Positives

```dart
// When linter is wrong, document why
// ignore: prefer_const_constructors
Widget build(BuildContext context) {
  // Constructor can't be const due to dynamic theme
  return Container(
    color: Theme.of(context).primaryColor,
  );
}
```

### 3. Generated Code Issues

Generated files are excluded in `analysis_options.yaml`:

```yaml
analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "**/*.mocks.dart"
```

This linting guide ensures consistent, high-quality code across the project while helping developers catch issues early and maintain best practices.