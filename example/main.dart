import 'package:davinci/davinci.dart';
import 'package:davinci/core/davinci_capture.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ///1.create a globalkey variable
  GlobalKey imageKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///2. wrap the desired widget with Davinci widget
            Davinci(
              builder: (key) {
                ///3. set the widget key to the globalkey
                this.imageKey = key;
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
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: TextButton(
                onPressed: () async {
                  ///4. pass the globalKey varible to DavinciCapture.click.
                  await DavinciCapture.click(imageKey);
                },
                child: Text('capture',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
