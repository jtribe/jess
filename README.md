# ジェス (Jess)
[日本語紹介](./読んでみて下さい.md)

A gesture based debug drawer for iOS, written in Swift 3.

## How To Use
Download the project and drop the files in. There's no Pod support yet. And I hate Git Submodules! (Sorry Simon!)

Call `addJesstures()` in the `viewDidLoad()` method of the `UIViewController` you want gestures enabled on.

Add the following line to your AppDelegate OR Constants file.
```swift
static let jessEngine: JessEngine = JessEngine.sharedInstance
```

Also add the following Key and Value pair to your Info.plist:

```xml
<key>ForceDebugDrawer</key>
<false/>
```
Setting this key to `true` (YES, in Info.plist GUI) will unlock full Debug Drawer functionality in **RELEASE**. By default, this is false. Jess will show a build popup for **RELEASE** config, and the debug drawer in **DEBUG**.

Add a view controller to a Storyboard file in your project that you will use for your Debug Drawer. Wire up a Segue to it, and **make sure** the segue identifier is equal to `DebugViewControllerSegue`.

Finally, edit the puzzle in `Jess.swift`.

## Screenshots

<img src="https://github.com/jtribe/jess/raw/master/Screenshots/Drawer.png" width="320"/>
<img src="https://github.com/jtribe/jess/raw/master/Screenshots/Popup.png" width="320"/>
