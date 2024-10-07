<img src="https://i.ibb.co/wJMkxM5/Oakbridge-Middle-School.png">

<br>
<b>Davinci</b> is a powerful package that allows you to convert any widget into an image, which can be saved locally or shared across apps and chats. Perfect for creating snapshots of your UI! 📸

## 🛠️ Supported Platforms
| Platform | Status  |
| -------- | ------- |
| Android  | ✅      |
| iOS      | ✅      |
| Web      | ✅      |

*Feel free to test it on other platforms and report back with your findings!* 🚀

## 📹 Preview
<img src="https://i.ibb.co/3c4MkNK/screen-20241007-171726-ezgif-com-video-to-gif-converter.gif" height="500">

## Prerequisites

**For iOS**  
Add the following keys to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:
- `NSPhotoLibraryUsageDescription` - Describe why your app needs permission for the photo library. This is called _Privacy - Photo Library Usage Description_ in the visual editor.

**For Android**  
Add the following permission to your `AndroidManifest.xml`:
- `android.permission.WRITE_EXTERNAL_STORAGE` - Permission for usage of external storage.

## ℹ️ Usage

### Imports
```dart
import 'package:davinci/core/davinci_capture.dart';
import 'package:davinci/davinci.dart';
```

### Code

#### If the widget is in the widget tree, use the `click` method:

<img src="https://i.ibb.co/tqzgRKt/click.png">

#### If the widget is not in the widget tree, use the `offStage` method:

<img src="https://i.ibb.co/MCjW4zM/offstage.png">

<hr>

## 🎨 Customization
<img src="https://i.ibb.co/48byC4m/props.png">

ℹ️ <i><b>All the parameters in the `click` method are present in the `offStage` method except the `brandTag` prop.</i></b>

## 🛎️ Note:
- **If you wish to save the generated images locally, do remember to add the necessary permissions in `Info.plist` and `AndroidManifest.xml`.**
