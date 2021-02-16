import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/qr_scan.dart';
import 'URLFetchData.dart';

void main() => runApp(MaterialApp(home: AppQR()));

class AppQR extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppQR> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "QR scanner",
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[900],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 240, bottom: 30),
                child: Text(
                  'Press the scan button to start scanning',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w100),
                ),
              ),
              Center(
                child: ScanButton(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 220),
                child: Text(
                  'powered by Gatee',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScanButton extends StatelessWidget {
  const ScanButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 100.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => MyApp()));
        },
        color: Colors.blue[900],
        textColor: Colors.white,
        child: const Text(
          'Scan',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
