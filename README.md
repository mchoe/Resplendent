Resplendent
===========

Resplendent is a unit tested color library for iOS and Mac written in Swift. It provides multiple helpers for common colors tasks such as creating colors from hex strings and much more.


Create a Color From Hex String
------------------------------

The leading "#" is optional

```swift
let exampleUIColor = UIColor("#bbcc12")
let exampleNSColor = NSColor("54ff00")
```

Hex String from UIColor and NSColor
-----------------------------------

Results are returned without the leading "#" and all caps

```swift
let exampleUIColor = UIColor.brownColor
let hexString = exampleUIColor.hexString()   // outputs "996633"
```


Install
-------

Resplendent is meant to be dropped in to any project. Pick and choose the files you need, but you can install all the extensions via [Carthage](https://github.com/Carthage/Carthage):
	
	github "mchoe/Resplendent" ~> 1.0


License
-------

Resplendent is released under the [MIT License](https://github.com/mchoe/Resplendent/blob/master/LICENSE).