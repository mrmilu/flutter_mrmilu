# Front mobile Flutter Mr.Milú package

This package collects a handful amount of methods, classes, interfaces and more that can and should be reused across any Mr.Milú project.

## Features

- Validators
  - Date
  - Document
  - Password
  - Social security number
- Utils
  - Extensions
    - String
    - Int
    - DateTime
  - Http overrides (mobile only)
- Services abstractions
  - Dio (Api REST)
- Helpers

## Usage

1. Add this package to pubspec.yaml with:

    ```yaml
    flutter_mrmilu: <version>
    ```

    Replace `<version>` with version that you need

2. Import package `import 'package:flutter_mrmilu/flutter_mrmilu.dart';`
3. Use classes and methods. Can see example or read documentation of each class and method for more context

## Contributing

To modify this package, you can open a new [issue](https://github.com/mrmilu/flutter_mrmilu/issues/new/choose) or a [pull request](https://github.com/mrmilu/flutter_mrmilu/compare).

### Generate version

- Start release `git flow release start X.X.X`
- Update version in pubspec.yaml
- Generate changelog with `npm install` and `npm run release`
- Commit changes `chore(release): X.X.X`
- (optional) Push changes to release branch to test
- Finish release `git flow release finish X.X.X`

### Index

Need regenerate index when add or delete files. To do this, use command `flutter pub pub run index_generator`
