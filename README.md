# Davinci
<img src ="https://i.ibb.co/wJMkxM5/Oakbridge-Middle-School.png">
<br>
A simple flutter package to convert any widget to an image which can be used to share to other apps and chats.


## 📹 Preview
<img src ="https://i.ibb.co/8bt4H43/ezgif-com-gif-maker.gif" width="250" height="500">

## ℹ️ Usage
#### Imports
```
import 'package:davinci/davinci.dart';
import 'package:davinci/core/davinci_capture.dart';
```

#### Pseudo code
<img src ="https://i.ibb.co/tCgQpM3/carbon-1.png" width="500" height="450">

 ### ℹ️  <i>If the widget, you are trying to capture is rendered in a way that you have to scroll to see the entire widget, then wrap the entire widget with `SingleChildScrollView` and then call DavinciCapture.click method.</i>

By default the generated image name will be "davinci". But if you wish to change it, you can pass the image name in  DavinciCapture.click method
```
await DavinciCapture.click(imageKey, fileName: "Hello", pixelRatio: 1.0);
```

when the image is captured, you can either `openFilePreview` or `returnImageUint8List`, by default the `openFilePreview` is **true** and `returnImageUint8List` is **false**

```
await DavinciCapture.click(imageKey, fileName: "Hello", openFilePreview = false, returnImageUint8List = true);
```

## 🛎️ Note
<B>The Generated image can be shared to other apps and chats but it is stored temporary storage on the device, which you can NOT access in iOS. If you wish to save it locally, you can save it from the preview page. But do remeber to add necessary permissions in `info.plist` and `AndroidManifest.xml`. </B>
