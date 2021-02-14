import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import './URLFetchData.dart';

var qrText = "";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //qr setup
  GlobalKey qrKey = GlobalKey();

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
        ],
      ),
    );
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  bool isRead = false;
  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      qrText = scanData;
      if (isRead == false) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => QRDataJSON(qrLink: qrText)));
      }
      isRead = true;
      return 0;
    });
  }
}
