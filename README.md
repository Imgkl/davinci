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
<img src="https://i.ibb.co/7zkmKwX/ezgif-com-gif-maker.gif" width="250" height="500">

## ℹ️ Usage

:warning: **Important:** From version 2.1.0, passing `context` is now required in the `click` and `offStage` methods due to deprecated methods in Flutter version 3.10.

### Prerequisites

**For iOS**  
Add the following keys to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:
- `NSPhotoLibraryUsageDescription` - Describe why your app needs permission for the photo library. This is called _Privacy - Photo Library Usage Description_ in the visual editor.

**For Android**  
Add the following permission to your `AndroidManifest.xml`:
- `android.permission.WRITE_EXTERNAL_STORAGE` - Permission for usage of external storage.

### Imports
```dart
import 'package:davinci/core/davinci_capture.dart';
import 'package:davinci/davinci.dart';
```

### Pseudo Code

| Widget in Widget Tree  <br> Use `click` method | Widget Not in Widget Tree <br> Use `offStage` method |
| :---: | :---: |
| <img src="https://i.ibb.co/tCgQpM3/carbon-1.png" width="550" height="420"> | <img src="https://i.ibb.co/bX9tGQV/carbon-2.png" width="450" height="250"> |

<hr>

## Dynamic Branding Footer

A dynamic branding footer can be added to widgets that can be added to off-stage widgets. 

ℹ️ <i><b>This branding footer (`brandTag` parameter) is currently available only on the `offStage` method. Support for the `click` method will be added soon.</i></b>

You can add the branding footer like this:

```dart
await DavinciCapture.offStage(
  context: context,
  const PreviewWidget(),

  /// Footer can be dynamically added for off-stage Widgets
  brandTag: BrandTagConfiguration(
    padding: const EdgeInsets.only(left: 20, right: 20),
    decoration: const BoxDecoration(color: Colors.black),
    leading: const Text(
      "Footer dynamically added, Inspired from Reddit",
      style: TextStyle(fontSize: 14),
    ),
    trailing: const Icon(
      LineIcons.redditAlien,
      color: Color(0xffFF4500),
    ),
  ),
);
```
<img src="https://i.ibb.co/ccWpFqX/Screenshot-2023-03-24-at-5-46-15-PM.png" width="500"> 

<hr>

By default, the generated image name will be "davinci." If you wish to change it, you can pass the image name in the `DavinciCapture.click` method:

```dart
await DavinciCapture.click(context: context, imageKey, fileName: "Hello");
```

<hr>

When the image is captured, you can either open the image preview or get the image in `Uint8List`:

```dart
await DavinciCapture.click(context: context, imageKey, fileName: "Hello", openFilePreview: false, returnImageUint8List: true);
```

<hr>

If the captured image is pixelated, calculate the pixel ratio dynamically based on the device and pass it to the `DavinciCapture.click` method:

```dart
double pixelRatio = MediaQuery.of(context).devicePixelRatio;

await DavinciCapture.click(context: context, imageKey, fileName: "Hello", pixelRatio: pixelRatio);
```

<hr>

To save the image directly to the device, set the `saveToDevice` flag to `true`. You can also specify the album name or leave it undefined:

```dart
await DavinciCapture.click(context: context, imageKey, fileName: "Hello", saveToDevice: true, album: "Davinci", openFilePreview: false);
```

<hr>

ℹ️ <i><b>All the parameters in the `click` method are present in the `offStage` method except the `brandTag` prop.</i></b>

## 🛎️ Note:
- **If you wish to save the generated images locally, do remember to add the necessary permissions in `Info.plist` and `AndroidManifest.xml`.**
