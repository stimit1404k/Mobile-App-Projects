# Project Template

Use this template when adding a new project to the repository.

## Project Structure

Each project should follow this structure:

```
projects/project-name/
├── lib/
│   ├── main.dart
│   ├── models/
│   ├── screens/
│   ├── widgets/
│   └── services/
├── test/
├── assets/
│   ├── images/
│   └── fonts/
├── pubspec.yaml
└── README.md (Project-specific)
```

## Project README Template

Create a `README.md` file in your project directory with the following information:

```markdown
# Project Name

Brief description of what the project does.

## Screenshots

[Add screenshots of your app here]

## Features

- Feature 1
- Feature 2
- Feature 3

## Getting Started

### Prerequisites

- Flutter SDK
- [Any other specific requirements]

### Installation

1. Navigate to the project directory:
   ```bash
   cd projects/project-name
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

List the main packages used:
- package_name: ^version - Description

## Technical Details

### Architecture
[Describe the architecture pattern used: MVC, MVVM, BLoC, Provider, etc.]

### State Management
[Describe the state management solution: setState, Provider, Riverpod, BLoC, etc.]

### Key Packages
[List and describe key packages used]

## Lessons Learned

[Optional: Share what you learned building this project]

## Future Improvements

- [ ] Improvement 1
- [ ] Improvement 2

## License

[License information]

## Author

stimit1404k
```

## Naming Conventions

### Project Names
- Use lowercase with underscores: `my_awesome_app`
- Be descriptive but concise
- Avoid generic names like "app1" or "test"

### Code Style
Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style):
- Use `lowerCamelCase` for variables and functions
- Use `UpperCamelCase` for class names
- Use `lowercase_with_underscores` for file names
- Maximum line length: 80 characters

## Best Practices

1. **Code Organization**
   - Separate concerns into different directories (models, screens, widgets, services)
   - Keep files small and focused
   - Use meaningful names

2. **Documentation**
   - Add comments for complex logic
   - Document public APIs
   - Keep README updated

3. **Version Control**
   - Commit regularly with meaningful messages
   - Don't commit generated files or build artifacts
   - Use .gitignore appropriately

4. **Testing**
   - Write unit tests for business logic
   - Write widget tests for UI components
   - Write integration tests for critical flows

5. **Assets**
   - Optimize images before adding them
   - Use vector graphics (SVG) when possible
   - Organize assets in appropriate directories

## Checklist for New Projects

Before considering a project complete, ensure:

- [ ] Code follows Dart style guide
- [ ] Project has a comprehensive README
- [ ] All dependencies are properly declared in pubspec.yaml
- [ ] App runs without errors on at least one platform
- [ ] Basic tests are included (if applicable)
- [ ] Assets are optimized and properly referenced
- [ ] Code is properly commented
- [ ] No sensitive data (API keys, passwords) is committed
- [ ] Repository README is updated with project information

## Example pubspec.yaml

```yaml
name: project_name
description: A brief description of your Flutter project.
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  # Add other dependencies here

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  
  # Uncomment and configure as needed
  # assets:
  #   - assets/images/
  #   - assets/fonts/
  
  # fonts:
  #   - family: CustomFont
  #     fonts:
  #       - asset: assets/fonts/CustomFont-Regular.ttf
  #       - asset: assets/fonts/CustomFont-Bold.ttf
  #         weight: 700
```
