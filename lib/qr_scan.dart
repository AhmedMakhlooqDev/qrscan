import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import './URLFetchData.dart';
import './modals/qrdata.dart';
import 'package:http/http.dart' as http;

var qrText = "";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //qr setup
  GlobalKey qrKey = GlobalKey();

  Future<QrData> fetchQRDATA() async {
    print("hello: $qrText");
    final response = await http.get(qrText);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var decode = jsonDecode(response.body);
      return QrData.fromJson(decode);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  QRViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(
                    borderRadius: 10,
                    borderColor: Colors.green,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300),
                onQRViewCreated: _onQRViewCreate),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: Text('Scan result: $qrText'),
              ))
        ],
      ),
    );
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        qrText = scanData;

        await fetchQRDATA();

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => QRDataJSON(
                  jsonData: [],
                )));
      });
    });
  }
}
