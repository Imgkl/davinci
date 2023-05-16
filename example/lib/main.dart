import 'package:davinci/davinci.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(const MaterialApp(home: App(), debugShowCheckedModeBanner: false));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  ///1.create a globalkey variable
  GlobalKey? imageKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9C5D1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///2. wrap the desired widget with Davinci widget
            Davinci(
              builder: (key) {
                ///3. set the widget key to the globalkey
                imageKey = key;
                return Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.red,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.yellow,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff9795EF),
                ),
                onPressed: () async {
                  ///4. pass the globalKey varible to DavinciCapture.click.
                  await DavinciCapture.click(
                      context: context, imageKey!, pixelRatio: 3);
                },
                child: const Text('Capture widget in screen',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff9795EF),
              ),
              onPressed: () async {
                ///If the widget was not in the widget tree or not present on the screen
                ///pass the widget that has to be converted into image.
                await DavinciCapture.offStage(
                    context: context, const PreviewWidget());
              },
              child: const Text('Capture widget off-stage'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff9795EF),
              ),
              onPressed: () async {
                ///If the widget was not in the widget tree or not present on the screen
                ///pass the widget that has to be converted into image.
                ///Also we can add footer to the widgets to offStage widgets as well
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
              },
              child: const Text('Capture widget off-stage with footer'),
            )
          ],
        ),
      ),
    );
  }
}

/// This widget is not mounted when the App is mounted.
class PreviewWidget extends StatelessWidget {
  const PreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.orange,
      child: const Center(
        child: Text(
          "This widget was not in widget tree",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
