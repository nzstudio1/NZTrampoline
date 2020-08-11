
# NZTrampoline

[![CI Status](https://img.shields.io/travis/nzstudio/NZTrampoline.svg?style=flat)](https://travis-ci.org/nzstudio/NZTrampoline)
[![Version](https://img.shields.io/cocoapods/v/NZTrampoline.svg?style=flat)](https://cocoapods.org/pods/NZTrampoline)
[![License](https://img.shields.io/cocoapods/l/NZTrampoline.svg?style=flat)](https://cocoapods.org/pods/NZTrampoline)
[![Platform](https://img.shields.io/cocoapods/p/NZTrampoline.svg?style=flat)](https://cocoapods.org/pods/NZTrampoline)

## Summary
Allows you to declare multiple objects as a delegate.

## Introduction
Basic paradigm for object delegation is depicted as follows:
![Basic paradigm for object delegation](https://github.com/nzstudio1/NZTrampoline/blob/master/docs/1.png?raw=true)

What if we want to have multiple delegates?
NZTrampoline allows you to delcare multiple delegates while it supports  chaining:
![How NZTrampoline allows you to declare multiple delegates](https://github.com/nzstudio1/NZTrampoline/blob/master/docs/2.png?raw=true)

## Use Case
Suppose we want to develop MyMagicScrollView, a subclass of UIScrollView that performs some computations when the user interacts with it (such as dragging). We are interested in publishing MyMagicScrollView as a separate module and provide it to other developers so it's kind of a black-box.

In MyMagicScrollView's implementation we set it's delegate to an object of NZTrampoline. This trampoline allows to implement delegate methods while forwards all the of them to another object. 
![MyMagicScrollView with it's own trampoline delegate and able to forward all delegate methods to the final delegate.](https://github.com/nzstudio1/NZTrampoline/blob/master/docs/3.png?raw=true)
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

NZTrampoline is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NZTrampoline'
```

## Author

Hamidreza Vakilian, hamid@nzstudio.dev

## License

NZTrampoline is available under the MIT license. See the LICENSE file for more info.
