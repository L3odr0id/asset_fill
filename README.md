<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package automatically adds to pubspec.yaml all the subfolders from asstes.

<!-- ## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package. -->

## Usage

- Make sure that your pubspec.yaml declares a flutter dictionary and a list of assets that contains at least one placeholder element as shown below. Consider checking the [example](https://github.com/L3odr0id/asset_fill/blob/61479a2aafa1e3040063df828b153dbe4619419c/example/pubspec.yaml#L56).
```yaml
flutter:
  # stuff
  assets:
    - placeholder
```
- Place your files and folders to an assets directory.
- Execute following command:

```bash
flutter pub run asset_fill
```
- Remove the placeholder

<br></br>

## Watch the example

![Demo gif](https://github.com/L3odr0id/asset_fill/blob/master/gif/functionality.gif)





<!-- ## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more. -->
