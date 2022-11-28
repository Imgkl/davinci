## [2.0.7] - Updated `openFile` obsolete package with better alternative.
## [2.0.6] - `returnImageUint8List` was broken before and now it's fixed. Silly mistake of not adding a `return` statement 🙈.  
- Thanks to<a href="https://github.com/gsoykan"> gsoykan</a>. PR<a href="https://github.com/Imgkl/davinci/pull/22"> #22</a>. 

## [2.0.5] - code optimised using pedantic analyzer

## [2.0.4] - same parmeters in `click` and `offStage` methods

 - All the parameters in the click method is now avaliable in offStage method.
 - `logicalSize` and `imageSize` parameters are removed in offStage method in favour of `pixelRatio` parameter.
 - Code optimization.

## [2.0.3] - Fixed Raw Keyboard exception
- Thanks to<a href="https://github.com/Coron on"> Rubin Raithel</a>. PR<a href="https://github.com/Imgkl/davinci/pull/11"> #11</a>. 
## [2.0.2] - updated Readme

## [2.0.1] - Added `saveToDevice` support

- Added `SaveToDevice` parameter to the click and offStage method. Now the images can be directly saved to gallery/photos app.

## [2.0.0] - Added offStage support

- If the widget is not mounted in the widget tree, pass the widget in the `DavinciCapture.offStage`. Huge thanks to <a href="https://github.com/christian-muertz"> Christian Muertz</a>.

## [1.0.5] - Added capture parameters

- The pixelRatio can be user defined instead of the static value 3.
- when the image is captured, you can either `openFilePreview` or `returnImageUint8List`
- Minor bug fixes

## [1.0.0] - Null safety support

## [0.0.3] - Initial Release