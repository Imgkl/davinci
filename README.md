# Davinci
<img src ="https://i.ibb.co/wJMkxM5/Oakbridge-Middle-School.png">
<br>
<br>
A flutter package to convert any widget to image.


## Preview
<img src ="https://i.ibb.co/8bt4H43/ezgif-com-gif-maker.gif" width="250" height="500">

## Usage
#### Imports
```
import 'package:davinci/davinci.dart';
import 'package:davinci/core/davinci_capture.dart';
```

#### Pseudo code
<img src ="https://i.ibb.co/tCgQpM3/carbon-1.png" width="450" height="450">

So by default the generated image name will be "davinci". But if you wish to change it, you can pass the image name in  DavinciCapture.click method
```
await DavinciCapture.click(imageKey, fileName: "Hello");
```

## Note
<B>The Generated image can be shared to other apps and chats but it is NOT stored anywhere on the device. If you wish to save it locally, you can save it from the preview page. But do remeber to add necessary permissions in `info.plist` and `AndroidManifest.xml`. </B>
