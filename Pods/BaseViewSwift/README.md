[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/ustwo/baseview-swift/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/ustwo/baseview-swift.svg?branch=master)](https://travis-ci.org/ustwo/baseview-swift)
[![codecov.io](https://codecov.io/github/ustwo/baseview-swift/coverage.svg?branch=master)](https://codecov.io/github/ustwo/baseview-swift?branch=master)

# BaseViewSwift

The BaseViewSwift framework provides an organizational tool for writing custom views using `UIKit`. This framework is written using Swift 3.0. It has been developed and used by iOS developers at [ustwo](ustwo.com).

## Dependencies

* [Xcode](https://itunes.apple.com/gb/app/xcode/id497799835?mt=12#)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate BaseViewSwift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
platform :ios, '8.3'

use_frameworks!

pod 'BaseViewSwift', '~> 1.0.0'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate BaseViewSwift into your project manually. Add the `BaseView.swift` file from the `Sources` folder to your Xcode project.

## Usage

Use the `BaseView` as a base class for all your custom views. Then override our common setup functions and have them automatically called as part of the initialization.

`BaseView` itself is a subclass of `UIView`. It contains three empty setup functions that are called by both `init(frame:)` and `awakeFromNib()`. These commonly used setup functions are `setup()`, `setupConstraints()`, and `setupAccessibility()` and are called in that order.

## Examples

Here are some example implementations of using the three setup functions in practice. In all of the examples we call `super` on the setup function, but do this as appropriate in your own code.

We use `titleLabel` throughout our examples. We assume that this has been added as a `UILabel` property to the custom view.

### setup

Use the `setup()` function to initialize and subviews, set default values, etc.

```swift
override func setup() {
  super.setup()

  backgroundColor = UIColor.red

  titleLabel = UILabel()
  titleLabel.text = "Some text"
  addSubview(titleLabel)
}
```

### setupConstraints

Use the `setupConstraints()` function to add layout constraints for all the subviews.

```swift
override func setupConstraints() {
  super.setupConstraints()

  titleLabel.translatesAutoresizingMaskIntoConstraints = false

  addConstraint(NSLayoutContaint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: 0.0))
  addConstraint(NSLayoutContaint(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: 0.0))
  addConstraint(NSLayoutContaint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0))
}
```

### setupAccessibility

Use the `setupAccessibility()` function to add any `accessibilityIdentifier` for testing/debugging as well as any `accessibilityLabel` and `accessibilityHint` as appropriate for your users.

Note that it is best to use this for static identifiers that will not change at runtime. For dynamically generated identifiers or identifiers that will change over time, we recommend doing this in the view controller or view model as appropriate.

```swift
override func setupAccessibility {
  super.setupAccessibility()

  titleLabel.accessibilityIdentifier = "TITLE"
}
```
## Contributing

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms. See the [Code of Conduct](https://github.com/ustwo/baseview-swift/blob/master/CODE_OF_CONDUCT) file

## Contributors

* [Shagun Madhikarmi](mailto:shagun@ustwo.com)
* [Aaron McTavish](mailto:aamct@ustwo.com)

## License

BaseViewSwift is released under the MIT License. See the LICENSE file.
