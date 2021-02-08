import 'package:flutter/material.dart';
import 'package:qrscan/qr_scan.dart';

void main() => runApp(MaterialApp(home: AppQR()));

class AppQR extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "QR scanner",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 200.0,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyApp()));
                },
                color: Colors.black,
                textColor: Colors.white,
                child: const Text(
                  'Scan',
                  style: TextStyle(fontSize: 25),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
