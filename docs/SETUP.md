# Setup Guide

This guide will help you set up the development environment for working with Flutter projects in this repository.

## Prerequisites

### 1. Install Flutter SDK

#### Windows
1. Download Flutter SDK from [flutter.dev](https://docs.flutter.dev/get-started/install/windows)
2. Extract the zip file to a desired location (e.g., `C:\src\flutter`)
3. Add Flutter to your PATH environment variable
4. Run `flutter doctor` to verify installation

#### macOS
1. Download Flutter SDK from [flutter.dev](https://docs.flutter.dev/get-started/install/macos)
2. Extract the zip file to a desired location (e.g., `~/development/flutter`)
3. Add Flutter to your PATH by editing `~/.zshrc` or `~/.bash_profile`:
   ```bash
   export PATH="$PATH:[PATH_TO_FLUTTER_DIRECTORY]/flutter/bin"
   ```
4. Run `flutter doctor` to verify installation

#### Linux
1. Download Flutter SDK from [flutter.dev](https://docs.flutter.dev/get-started/install/linux)
2. Extract the tar file to a desired location
3. Add Flutter to your PATH
4. Run `flutter doctor` to verify installation

### 2. Install IDE

Choose one of the following:

#### VS Code (Recommended for beginners)
1. Download and install [VS Code](https://code.visualstudio.com/)
2. Install Flutter extension from the Extensions marketplace
3. Install Dart extension (usually installed automatically with Flutter extension)

#### Android Studio
1. Download and install [Android Studio](https://developer.android.com/studio)
2. Install Flutter plugin from Settings > Plugins
3. Install Dart plugin (usually installed automatically with Flutter plugin)

### 3. Set up Platform-Specific Requirements

#### For Android Development
1. Install Android Studio
2. Install Android SDK (usually comes with Android Studio)
3. Create an Android Virtual Device (AVD) or connect a physical device
4. Enable USB debugging on your Android device (if using physical device)

#### For iOS Development (macOS only)
1. Install Xcode from the Mac App Store
2. Run `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`
3. Run `sudo xcodebuild -runFirstLaunch`
4. Install CocoaPods: `sudo gem install cocoapods`
5. Connect an iOS device or use iOS Simulator

### 4. Verify Installation

Run the following command to check if everything is set up correctly:

```bash
flutter doctor -v
```

Fix any issues reported by `flutter doctor` before proceeding.

## Running a Project

1. Navigate to the project directory:
   ```bash
   cd projects/[project-name]
   ```

2. Get the dependencies:
   ```bash
   flutter pub get
   ```

3. Check available devices:
   ```bash
   flutter devices
   ```

4. Run the app:
   ```bash
   # Run on default device (debug mode)
   flutter run
   
   # Run on specific device
   flutter run -d [device-id]
   
   # Run in release mode
   flutter run --release
   ```

## Common Commands

```bash
# Create a new Flutter project
flutter create project_name

# Get dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Run the app
flutter run

# Build APK (Android)
flutter build apk

# Build app bundle (Android)
flutter build appbundle

# Build iOS app (macOS only)
flutter build ios

# Clean build artifacts
flutter clean

# Analyze code
flutter analyze

# Format code
flutter format .

# Run tests
flutter test
```

## Troubleshooting

### Common Issues

1. **"flutter: command not found"**
   - Make sure Flutter is added to your PATH
   - Restart your terminal after updating PATH

2. **Android licenses not accepted**
   - Run: `flutter doctor --android-licenses`
   - Accept all licenses

3. **iOS build issues (macOS)**
   - Make sure Xcode is properly installed
   - Run: `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`
   - Try: `pod repo update` in the iOS directory

4. **Gradle build issues (Android)**
   - Check your internet connection
   - Try: `flutter clean` followed by `flutter pub get`
   - Delete the `.gradle` folder and rebuild

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [Dart Packages](https://pub.dev/)
