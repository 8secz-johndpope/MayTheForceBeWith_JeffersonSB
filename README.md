# MayTheForceBeWith JeffSB ![progress](https://progress-bar.dev/97/?title=completed "progress") 

  * [x] Deployment Target iOS 9.3+
  * [x] iOS Design Patterns: VIPER
  * [x] Environments [Developer, Staging, Release]
  * [x] Devices: iPhone and Ipad
  * [x] On people’s list, search for a persons' name is ok.
  * [x] The people’s list layout
  * [x] Paginated 10 people at a time and loading 10 more after bouncing at the bottom.
  * [x] AppIcons OK
  * [x] Detail screen for the selected Person
  * [x] Mark people as favorite
  * [x] Accessibility Coverage 100%
  * [x] Loading 10 more activity indicator
  * [x] DateFormatter to dates into people detail
  
  ![progress](https://progress-bar.dev/29 "progress") Coverage UnitTests
  
  ![progress](https://progress-bar.dev/60 "progress") Coverage UITest
  
## Requirements
- Xcode 11.0+

## Install
This project uses CocoaPods as its dependency manager, so after cloning the project.

Run the following command on the terminal:
```
$ cd /MayTheForceBeWith_JeffersonSB
$ pod install
```

In some cases you will need to use the command below:
```
$ pod install --repo-update
```

## Debug Accessibility

Debug Accessibility in iOS Simulator with the Accessibility Inspector
The Accessibility Inspector displays accessibility information about each accessible element in an app. You can use the Accessibility Inspector to simulate VoiceOver interaction with the accessible elements in your app to examine the information they provide.
 
Note: The Accessibility Inspector is helpful for testing the accessibility of your app during development, but it is no substitute for testing your app with VoiceOver on a physical device. For one thing, the Accessibility Inspector does not speak accessibility information, so you can’t hear how your element descriptions will sound. Even though the Accessibility Inspector is ideal for quickly verifying that elements supply appropriate accessibility information, you should test your app on a device, with VoiceOver turned on, to make sure that it behaves as users expect. See Test Accessibility on Your Device with VoiceOver for some tips on how to do this.

https://developer.apple.com/library/archive/technotes/TestingAccessibilityOfiOSApps/TestAccessibilityonYourDevicewithVoiceOver/TestAccessibilityonYourDevicewithVoiceOver.html#//apple_ref/doc/uid/TP40012619-CH3-SW1


