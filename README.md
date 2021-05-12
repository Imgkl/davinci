# Davinci
<img src ="https://i.ibb.co/wJMkxM5/Oakbridge-Middle-School.png">
<br>
A simple flutter package to convert any widget to an image which can be used to share to other apps and chats.


## 📹 Preview
<img src ="https://i.ibb.co/8bt4H43/ezgif-com-gif-maker.gif" width="250" height="500">

## ℹ️ Usage

  <i><b> If the widget, you are trying to capture is rendered in a way that you have to scroll to see the entire widget, then wrap the entire widget with `SingleChildScrollView` and then call DavinciCapture.click method.</i> </b>
#### Imports
```
import 'package:davinci/davinci.dart';
import 'package:davinci/core/davinci_capture.dart';
```

#### Pseudo code
<img src ="https://i.ibb.co/tCgQpM3/carbon-1.png" width="500" height="450">


  
 <hr>
 By default the generated image name will be "davinci". But if you wish to change it, you can pass the image name in  DavinciCapture.click method


```
await DavinciCapture.click(imageKey, fileName: "Hello");
```
 <hr>
When the image is captured, you can either open the image preview or get the image in Uint8List


```
await DavinciCapture.click(imageKey, fileName: "Hello", openFilePreview = false, returnImageUint8List = true);

```
 <hr>
If the captured image is pixelated, calculate the pixel ratio dynamically based on the device and pass it to the DavinciCapture.click method.

```
double pixelRatio = MediaQuery.of(context).devicePixelRatio;

await DavinciCapture.click(imageKey, fileName: "Hello", pixelRatio: pixelRatio);up
```
<hr>

## 🛎️ Note :

 - <b>Cannot capture Platformview due to issue https://github.com/flutter/flutter/issues/25306 </b>
 - <b>The Generated image can be shared to other apps and chats but it is stored temporary storage on the device, which you can NOT access in iOS. If you wish to save it locally, you can save it from the preview page. But do remeber to add necessary permissions in `info.plist` and `AndroidManifest.xml`. 
For more info: https://pub.dev/packages/image_gallery_saver</b>
