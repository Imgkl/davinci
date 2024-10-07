# Davinci ![Supported Platforms](https://img.shields.io/badge/platforms-Android%20%7C%20iOS-green.svg) ![Pub version](https://img.shields.io/pub/v/davinci) ![MIT Lisence](https://img.shields.io/badge/license-MIT-blue.svg) ![linter](https://img.shields.io/badge/style-pedantic-blue) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/066e267c7beb4fcaa23ba00f2b3eb6b8)](https://www.codacy.com/gh/Imgkl/davinci/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Imgkl/davinci&amp;utm_campaign=Badge_Grade) ![PR's welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
<img src ="https://i.ibb.co/wJMkxM5/Oakbridge-Middle-School.png"> 


<br>
A package to convert any widget to an image which can be saved locally or can be shared to other apps and chats.


## 📹 Preview
<img src ="https://i.ibb.co/7zkmKwX/ezgif-com-gif-maker.gif" width="250" height="500">

## ℹ️ Usage

:warning: From version 2.1.0, passing `context` in required now in the `click` and `offStage` methods, this is due to some deprecated methods in Flutter version 3.10

#### Prerequisites

> on iOS

Add the following keys to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:

* `NSPhotoLibraryUsageDescription` - describe why your app needs permission for the photo library. This is called _Privacy - Photo Library Usage Description_ in the visual editor.

> on Android

* `android.permission.WRITE_EXTERNAL_STORAGE` - Permission for usage of external storage
#### Imports
```
import 'package:davinci/core/davinci_capture.dart';
import 'package:davinci/davinci.dart';
```

#### Pseudo code


| If the widget is in the widget tree  <br> Use `click` method| If the widget is not in the widget tree  <br> Use `offStage` method | 
| :---: | :---: |
| <img src ="https://i.ibb.co/tCgQpM3/carbon-1.png" width="550" height="420"> | <img src ="https://i.ibb.co/bX9tGQV/carbon-2.png" width="450" height="250"> | 

<hr>
<b> <h3> Dynaimc Branding footer </h3> </b>

Dynamic branding footer can be added to widgets that can be added to off-stage widgets. 

ℹ️ <i><b>This branding footer (````brandTag```` parameter) is currrently available only on ````offStage```` method. For ````click```` method, it'll be added soon.</i></b>

Branding footer can be added like this.

````
                await DavinciCapture.offStage(
                  context: context,
                  const PreviewWidget(),

                  /// Footer can be dynamically added for offStage Widgets
                  brandTag: BrandTagConfiguration(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const BoxDecoration(color: Colors.black),
                    leading: const Text(
                      "Footer dyamically added, Inspired from Reddit",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: const Icon(
                      LineIcons.redditAlien,
                      color: Color(0xffFF4500),
                    ),
                  ),
                );
````
<img src ="https://i.ibb.co/ccWpFqX/Screenshot-2023-03-24-at-5-46-15-PM.png" width="500"> 

<hr>
 By default the generated image name will be "davinci". But if you wish to change it, you can pass the image name in  DavinciCapture.click method.
 
```
await DavinciCapture.click(context: context, imageKey, fileName: "Hello");
```
<hr>
When the image is captured, you can either open the image preview or get the image in Uint8List.

```
await DavinciCapture.click(context: context, imageKey, fileName: "Hello", openFilePreview = false, returnImageUint8List = true);
```
 <hr>
If the captured image is pixelated, calculate the pixel ratio dynamically based on the device and pass it to the DavinciCapture.click method.

```
double pixelRatio = MediaQuery.of(context).devicePixelRatio;

await DavinciCapture.click(context: context, imageKey, fileName: "Hello", pixelRatio: pixelRatio);
```
<hr>

To save the image directly to the device, set `saveToDevice` flag to `true`. You can also specify the album name or you can leave it undefined.

````
await DavinciCapture.click(context: context, imageKey, fileName: "Hello", saveToDevice = true, album: "Davinci", openFilePreview = false);
````
<hr>

ℹ️ <i><b>All the parameters in the `click` method is present in `offStage` method except `brandTag` prop.</i></b>

## 🛎️ Note :
 - <b>If you wish to save the generated images locally, do remember to add necessary permissions in `info.plist` and `AndroidManifest.xml`. 

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
