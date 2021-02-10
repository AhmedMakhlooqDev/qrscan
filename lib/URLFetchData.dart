import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qrscan/qr_scan.dart';
import './modals/qrdata.dart';

// Future<QrData> fetchQRDATA() async {
//   print("hello");
//   final response = await http.get(qrText);

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return QrData.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load data');
//   }
// }

/*class QRData {
  String companyId;
  String code;
  String nameAr;
  String phone;
  String email;
  String currency;
  String subTotal;
  String invoiceID;
  String paymentStatues;
  String orderDate;

  QRData(
      {this.companyId,
      this.code,
      this.nameAr,
      this.phone,
      this.email,
      this.currency,
      this.subTotal,
      this.invoiceID,
      this.paymentStatues,
      this.orderDate});

  factory QRData.fromJson(Map<String, dynamic> json) {
    return QRData(
      companyId: json['company_id'],
      code: json['code'],
      nameAr: json['name_ar'],
      phone: json['phone'],
      email: json['email'],
      currency: json['currency'],
      subTotal: json['sub_total'],
      invoiceID: json['gatee_invoice_id'],
      paymentStatues: json['status'],
      orderDate: json['order_date'],
    );
  }
}*/

class QRDataJSON extends StatefulWidget {
  final List jsonData;
  QRDataJSON({Key key, @required this.jsonData}) : super(key: key);
  @override
  _QRDataJSONState createState() => _QRDataJSONState();
}

class _QRDataJSONState extends State<QRDataJSON> {
  QrData qr = QrData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "QR scanner",
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "name: ${qr.nameAr}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Company ID: ${qr.companyId}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Company e-mail: ${widget.jsonData}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$qrText',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ));
  }
}
