import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/qr_scan_page.dart';
import 'UIPrefrences.dart';

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
                padding: const EdgeInsets.only(top: 190, bottom: 30),
                child: Text(
                  'Press the scan button to start scanning',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w100),
                ),
              ),
              Center(
                child: ScanButton(name: 'Scan'),
              ),
              Container(
                height: 20.0,
              ),
              Center(
                child: ScanButton(name: 'Enter Number'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
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
