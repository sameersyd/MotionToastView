# MotionToastView - A Beautiful Toast Library for iOS Swift

[![CI Status](https://img.shields.io/travis/sameersyd/MotionToastView.svg?style=flat)](https://travis-ci.org/sameersyd/MotionToastView)
[![Version](https://img.shields.io/cocoapods/v/MotionToastView.svg?style=flat)](https://cocoapods.org/pods/MotionToastView)
[![License](https://img.shields.io/cocoapods/l/MotionToastView.svg?style=flat)](https://cocoapods.org/pods/MotionToastView)
[![Platform](https://img.shields.io/cocoapods/p/MotionToastView.svg?style=flat)](https://cocoapods.org/pods/MotionToastView)


A Beautiful Multipurpose Motion Toast Library in iOS using Swift 😍

![GitHub Cards Preview](https://github.com/sameersyd/templates/blob/master/_github_card_.png)

## Preview - Vibrant Toast 🌈
![gif](https://github.com/sameersyd/templates/blob/master/vibnt.gif)

## Preview - Pale Toast 🌟 
![gif](https://github.com/sameersyd/templates/blob/master/pale_light_.png)

## Preview - Dark Vibrant Toast 🌈
![gif](https://github.com/sameersyd/templates/blob/master/vibrant_dark.png)

## Preview - Dark Pale Toast 🌈
![gif](https://github.com/sameersyd/templates/blob/master/pale_dark_.png)


# Types of Toast Style ❤️


<table style="width:100%">
  <tr>
    <th>1. Pale Toast </th>
    <th>2. Vibrant Toast</th> 
    <th>3. Dark Pale Toast </th>
    <th>4. Dark Vibrant Toast</th> 
  </tr>
  <tr>
    <td><img src = "https://github.com/sameersyd/templates/blob/master/pale_light_.png"/></td> 
    <td><img src = "https://github.com/sameersyd/templates/blob/master/vibrant_light.png"/></td>
    <td><img src = "https://github.com/sameersyd/templates/blob/master/pale_dark_.png"/></td> 
    <td><img src = "https://github.com/sameersyd/templates/blob/master/vibrant_dark.png"/></td> 
  </tr>
</table>

## About

A Beautiful Multipurpose Motion Toast View in iOS using Swift with full customisation options. The library is developed using Swift 5.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

MotionToastView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MotionToastView'
```

Import MotionToastView in your class
```ruby
import MotionToastView
```

## 4️⃣ Toast types
```
        1 .success
        2 .error
        3 .warning
        4 .info
```

## ✌🏻 Toast styles
```
        1 .style_vibrant
        2 .style_pale
```

## ⌛️ Toast duration
```
        1 .short 	// 2 Seconds
        2 .long 	// 4 Seconds
```

# Usage 

## Sample Code for - Motion Toast View 🌟 

### Success Toast
(Basic)
```
MotionToast(message: "You have successfully completed the trip", toastType: .success)             
```

### Error Toast
(with corner radius)
```
MotionToast(message: "You have failed to complete the trip", toastType: .error, toastCornerRadius: 12)
```

### Warning Toast
(with duration, style, gravity, pulseEffect)
```
MotionToast(message: "You are not in the location. Try again", toastType: .warning, duration: .long, 
              toastStyle: .style_pale, toastGravity: .centre, pulseEffect: false)     
```

### Info Toast
(with duration, style, gravity)
```
MotionToast(message: "You have failed to complete the trip", toastType: .info, 
              duration: .long, toastStyle: .style_pale, toastGravity: .top)
```

## Note:
#### Light and Dark mode are set using system preference
#### toastCornerRadius parameter is only for toast style - vibrant

## Motion Toast View
<table style="width:100%">
  <tr>
    <th>Parameter</th>
    <th>Optional</th> 
    <th>Default Value</th>
    <th>Type</th>
    <th>Values Available</th>
  </tr>
  <tr>
    <td>message</td>
    <td>false</td>
    <td>nil</td>
    <td>String</td>
    <td>custom</td>
  </tr>
  <tr>
    <td>toastType</td>
    <td>false</td>
    <td>nil</td>
    <td>enum</td>
    <td>[.success, .error, .warning, .info]</td>
  </tr>
  <tr>
    <td>duration</td>
    <td>true</td>
    <td>.short</td>
    <td>enum</td>
    <td>[.short, .long]</td>
  </tr>
  <tr>
    <td>toastStyle</td>
    <td>true</td>
    <td>.style_vibrant</td>
    <td>enum</td>
    <td>[.style_vibrant, .style_pale]</td>
  </tr>
  <tr>
    <td>toastGravity</td>
    <td>true</td>
    <td>.bottom</td>
    <td>enum</td>
    <td>[.top, .centre, .bottom]</td>
  </tr>
  <tr>
    <td>toastCornerRadius</td>
    <td>true</td>
    <td>0</td>
    <td>Int</td>
    <td>custom</td>
  </tr>
  <tr>
    <td>pulseEffect</td>
    <td>true</td>
    <td>true</td>
    <td>Bool</td>
    <td>[true, false]</td>
  </tr>
</table>

## ✍🏻 Want More Customisation?
```
MotionToast_Customisation(header: "Custom Toast", message: "It gives you more customisation options.",
                            headerColor: UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0), 
                            messageColor: UIColor(red: 239.0, green: 239.0, blue: 239.0, alpha: 0.7), 
                            primary_color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5), 
                            secondary_color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), 
                            icon_image: UIImage(named: "apple")!, duration: .long, toastStyle: .style_pale, 
                            toastGravity: .bottom, toastCornerRadius: 12, pulseEffect: true)
```

## Checkout Android version of this library <a href="https://github.com/Spikeysanju/MotionToast">Motion Toast</a>
#### Design Inspired from <a href="https://github.com/Spikeysanju">@Spikeysanju</a>

## Donation
If this project helped you reduce time to develop, you can buy me a cup of coffee :) 

<a href="https://www.buymeacoffee.com/sameersyd" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## Author

Sameer Nawaz, sameer.nwaz@gmail.com

## License

MotionToastView is available under the MIT license. See the LICENSE file for more info.
