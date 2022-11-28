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
  - Link utils ([url_launcher](https://pub.dev/packages/url_launcher))
- Services abstractions
  - [Dio](https://pub.dev/packages/dio) (Api REST)
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
- Generate index if required: `fvm flutter pub run index_generator`
- Update version in pubspec.yaml
- Generate changelog with `npm install` and `npm run release`
  - Use `npm run release -- -r minor` or `npm run release -- -r major` to generate minor or major version changes
- Commit changes `chore(release): X.X.X`
- Create a pull request from release/X.X.X to master
- Merge pull request when approved
- Push tag X.X.X to master
- Pull request from master to develop
- Merge pull request when approved

### Index

Need regenerate index when add or delete files. To do this, use command `flutter pub pub run index_generator`
