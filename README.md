[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/ustwo/vip-demo-swift/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/ustwo/vip-demo-swift.svg?branch=master)](https://travis-ci.org/ustwo/vip-demo-swift)
[![codecov.io](https://codecov.io/github/ustwo/vip-demo-swift/coverage.svg?branch=master)](https://codecov.io/github/ustwo/vip-demo-swift?branch=master)

# VIP Demo
Swift sample app demonstrating View Interactor Presenter architecture for iOS. See [Clean Swift](http://clean-swift.com/clean-swift-ios-architecture/) for more info.

### Description

The app downloads Artists and Albums using [Last.fm's API](http://www.Last.fm/api) and presents them in a UITableView using a master detail user interface.

We started by using the excellent VIP templates from Raymond Law via [Clean Swift](http://clean-swift.com/clean-swift-ios-architecture/) but found ourselves modifying parts to speed up development, encapsulate the workers and routers better and to follow our code style guidelines.

You can find our modified VIP Xcode templates [here](https://github.com/ustwo/vip-templates).

### Demo

<image src="documentation/demo/demo1.gif" width=316 height=590/>

### Requirements

* [Xcode 8](http://adcdownload.apple.com/Developer_Tools/Xcode_8/Xcode_8.zip)
* [CocoaPods v1.1.0rc2](https://github.com/CocoaPods/CocoaPods/releases/tag/1.1.0.rc.2)
* [Last.fm](http://www.Last.fm/api) API Key (see below)

#### API Key

You will need an API key from Last.fm in order for the app to work.

Register here for an [API Key](http://www.Last.fm/api) and update the `apiKey` field in the `LastFMAPI.swift` as follows

	static let apiKey = "INSERT_YOUR_API_KEY_HERE"


### Environment

iOS 9.0+

### Libraries & submodules

* [BaseViewSwift v1.0.0](https://github.com/ustwo/baseview-swift)

(See [Podfile](https://github.com/ustwo/vip-demo-swift/blob/master/Podfile) for more info)

### Usage

You won't need [CocoaPods](https://cocoapods.org) to run the project but if you do run into issues you can install dependencies as follows:

    pod install

**Note.** If you get don't have CocoaPods installed you can install it using Ruby Gems as follows:

	gem install cocoapods --version 1.1.0rc2


### Configuration

The `VIPDemo` target should be used for running the project.


### Documentation

The source code files are documented using Xcode 8's built in code documentation support for Swift.

Also see [here](documentation/DIARY.md) for a summary of how we went about learning VIP architecture and building this sample app.

## Contributing

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms. See the [Code of Conduct](CODE_OF_CONDUCT.md) file.

### Maintainers

* [Daniela Dias](mailto:daniela@ustwo.com)
* [Shagun Madhikarmi](mailto:shagun@ustwo.com)

## Contact

[open.source@ustwo.com](mailto:open.source@ustwo.com)

## License

`VIP-Demo` is released under the MIT License.

See [License](LICENSE) and [Notice](NOTICE).
