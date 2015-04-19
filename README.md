# ConsoleBanner

[![CI Status](http://img.shields.io/travis/Brian Michel/ConsoleBanner.svg?style=flat)](https://travis-ci.org/Brian Michel/ConsoleBanner)
[![Version](https://img.shields.io/cocoapods/v/ConsoleBanner.svg?style=flat)](http://cocoapods.org/pods/ConsoleBanner)
[![License](https://img.shields.io/cocoapods/l/ConsoleBanner.svg?style=flat)](http://cocoapods.org/pods/ConsoleBanner)
[![Platform](https://img.shields.io/cocoapods/p/ConsoleBanner.svg?style=flat)](http://cocoapods.org/pods/ConsoleBanner)

## What Is This?

Just wanted to make a small thing that could print out a sweet banner when a debugger was connected to an application.
You may see these kinds of banners in page sources, or when you connect to servers, so why not your app?

Basically, it just looks for a `banner.txt` file in the main bundle to print out in your console before printing
system information.

You can generate some sweet ASCII art here http://patorjk.com/software/taag/

Check it out...
![](images/ascii-art.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ConsoleBanner is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ConsoleBanner"
```

## Author

Brian Michel, brian.michel@gmail.com

## License

ConsoleBanner is available under the MIT license. See the LICENSE file for more info.
