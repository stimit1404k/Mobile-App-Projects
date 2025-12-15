# Contributing to Flutter Projects

Thank you for your interest in this repository! While this is a personal projects portfolio, these guidelines can help you if you're forking the repository for your own use.

## Getting Started

1. Fork the repository
2. Clone your fork locally
3. Set up your development environment (see [SETUP.md](SETUP.md))
4. Create a new branch for your work

## Adding a New Project

### Step 1: Create the Project

Navigate to the `projects` directory and create a new Flutter project:

```bash
cd projects
flutter create your_project_name
```

### Step 2: Develop Your Application

Work on your project in the newly created directory. Follow the structure and best practices outlined in [PROJECT_TEMPLATE.md](PROJECT_TEMPLATE.md).

### Step 3: Document Your Project

1. Create a comprehensive README.md in your project directory
2. Include screenshots or GIFs demonstrating your app
3. List all features and technical details
4. Document any special setup requirements

### Step 4: Update Repository README

Update the main README.md file to include your project in the "Current Projects" section:

```markdown
### Current Projects

#### [Project Name](projects/project_name)
Brief description of what the project does.

**Features:**
- Feature 1
- Feature 2
- Feature 3

**Tech Stack:** Flutter, Dart, [other packages]

[Screenshot or demo GIF]
```

### Step 5: Commit Your Changes

```bash
git add .
git commit -m "Add [project name] - [brief description]"
git push origin your-branch-name
```

## Code Style Guidelines

### Dart/Flutter Code Style

Follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style):

1. **Naming Conventions**
   - Classes: `UpperCamelCase`
   - Functions/variables: `lowerCamelCase`
   - Files: `lowercase_with_underscores.dart`
   - Constants: `lowerCamelCase` (not SCREAMING_CAPS)

2. **Formatting**
   - Use `flutter format .` to auto-format your code
   - Maximum line length: 80 characters
   - Use trailing commas for better formatting

3. **Code Organization**
   ```
   lib/
   ├── main.dart
   ├── models/        # Data models
   ├── screens/       # Full-page screens
   ├── widgets/       # Reusable widgets
   ├── services/      # API calls, data services
   ├── utils/         # Helper functions
   └── constants/     # Constants and configuration
   ```

### Documentation

1. **Comments**
   - Use `///` for documentation comments
   - Use `//` for implementation comments
   - Document public APIs
   - Explain "why" not "what"

2. **README Files**
   - Include clear setup instructions
   - Add screenshots or demo videos
   - List all features
   - Document technical decisions

## Testing Guidelines

### Types of Tests

1. **Unit Tests** (`test/unit/`)
   - Test individual functions and classes
   - Test business logic
   - Use mocks for dependencies

2. **Widget Tests** (`test/widget/`)
   - Test individual widgets
   - Test widget interactions
   - Verify UI updates

3. **Integration Tests** (`integration_test/`)
   - Test complete user flows
   - Test on real or emulated devices
   - Verify app behavior end-to-end

### Writing Tests

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app/your_class.dart';

void main() {
  group('YourClass', () {
    test('should do something', () {
      // Arrange
      final instance = YourClass();
      
      // Act
      final result = instance.doSomething();
      
      // Assert
      expect(result, expectedValue);
    });
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/unit/your_test.dart

# Run with coverage
flutter test --coverage
```

## Commit Message Guidelines

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Examples

```
feat(auth): add login screen with email authentication

Implemented a login screen with email/password authentication
using Firebase Auth. Includes form validation and error handling.

Closes #123
```

```
fix(home): resolve navigation issue on back button press

The back button was not properly handling the navigation stack.
Updated the navigation logic to use WillPopScope.
```

```
docs(readme): update setup instructions for iOS

Added detailed steps for setting up iOS development environment
including CocoaPods installation.
```

## Project Checklist

Before considering a project complete:

- [ ] Code follows Dart style guide
- [ ] All files are properly formatted (`flutter format .`)
- [ ] No linter warnings (`flutter analyze`)
- [ ] App runs without errors
- [ ] Tests are passing (if applicable)
- [ ] README is comprehensive
- [ ] Screenshots/demos are included
- [ ] Dependencies are documented
- [ ] No sensitive data is committed
- [ ] Main repository README is updated

## Questions or Issues?

If you're using this repository as a template for your own projects and have questions, feel free to:

1. Check the [SETUP.md](SETUP.md) guide
2. Review the [PROJECT_TEMPLATE.md](PROJECT_TEMPLATE.md)
3. Look at existing projects as examples
4. Consult the [Flutter Documentation](https://flutter.dev/docs)

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Widget Catalog](https://flutter.dev/docs/development/ui/widgets)
- [Pub.dev Packages](https://pub.dev/)
- [Flutter Community](https://flutter.dev/community)

---

Happy coding! 🚀
