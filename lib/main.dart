import 'package:bloc_warna/color.dart';
import 'package:flutter/material.dart';
import 'color.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloC bloC = ColorBloC();
  @override
  void dispose() {
    bloC.disopose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                bloC.eventSink.add(ColorEvent.to_lightBlue);
              },
              backgroundColor: Colors.lightBlue,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                bloC.eventSink.add(ColorEvent.to_purple);
              },
              backgroundColor: Colors.purple,
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('BLoC Warna Cenah'),
        ),
        body: Center(
          child: StreamBuilder<Color>(
              stream: bloC.stateStream,
              initialData: Colors.lightBlue,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                );
              }),
        ),
      ),
    );
  }
}
