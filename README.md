# ジェス (Jess)
[日本語紹介](./読んでみて下さい.md)

A gesture based debug drawer for iOS, written in Swift 3. Name is short for "Gesture."

## How to use
Download the project and drop the files in. There's no Pod support yet. And I hate Git Submodules! (Sorry Simon!)

## Setting It Up
Ensure that your `UIViewController` instance conforms to the `Jess` protocol, and call `addJesstures()` in the `viewDidLoad()` method.

Add the following line to your AppDelegate:

```swift
static let jessEngine: JessEngine = JessEngine.sharedInstance
```

Also add the following Key and Value pair to your Info.plist:

```xml
<key>JessActive</key>
<true/>
```
Setting this key to `true` (YES, in Info.plist GUI) will unlock full Debug Drawer functionality. Setting it to false means that when you perform the gesture, a small popup containing the version and build of the app will be invoked.

### Build Phase
I recommend the use of an Xcode Build Phase to set the appropriate value in the Info.plist for the configuration. Ideally, the Debug drawer should not be accessible in a release build.

```bash
INFOPLISTPATH="$PROJECT_DIR/Path/To/Your/Info.plist"

echo "ジェスを設定中"
/usr/libexec/PlistBuddy -c "Delete :JessActive" "$INFOPLISTPATH"
/usr/libexec/PlistBuddy -c "Add :JessActive bool true" "$INFOPLISTPATH"
```

However if you're uncomfortable with using `PlistBuddy` then using the Info.plist key on its own is just fine and dandy.

## Use
Add a view controller to a Storyboard file in your project that you will use for your Debug Drawer. Wire up a Segue to it, and **make sure** the segue identifier is equal to `DebugViewControllerSegue`.

ジェス will take care of the rest!

YAAASSS... WERRRK!

## Screenshots

<img src="https://github.com/jtribe/jess/raw/master/Screenshots/Drawer.png" width="320"/>
<img src="https://github.com/jtribe/jess/raw/master/Screenshots/Popup.png" width="320"/>
