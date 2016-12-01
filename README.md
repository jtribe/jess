# コナミ (Ko-na-mi)
A gesture based debug drawer for iOS, written in Swift 3.

## How to use
Download the project and drop the files in. There's no Pod support yet. And I hate Git Submodules! (Sorry Simon!)

## Setting It Up
Ensure that your `UIViewController` instance conforms to the `Konami` protocol, and call `addKonamiGestures()` in the `viewDidLoad()` method.

Add the following line to your AppDelegate:

```swift
static let konamiEngine: KonamiEngine = KonamiEngine.sharedInstance
```

Also add the following Key and Value pair to your Info.plist:

```xml
<key>KonamiModeActive</key>
<true/>
```
Setting this key to `true` (YES, in Info.plist GUI) will unlock full Debug Drawer functionality. Setting it to false means that when you perform the gesture, a small popup containing the version and build of the app will be invoked.

## Use
Add a view controller to a Storyboard file in your project that you will use for your Debug Drawer. Wire up a Segue to it, and **make sure** the segue identifier is equal to `DebugViewControllerSegue`.

コナミ will take care of the rest!


YAAASSS... WERRRK!
