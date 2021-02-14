import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qrscan/qr_scan.dart';
import './modals/qrdata.dart';
import 'main.dart';

//List<QrData> qrDataList = [];

fetchJSON() async {
  var response = await http.get(qrText);
  if (response.statusCode == 200) {
    //String responseBody = response.body;
    //List<dynamic> data = json.decode(responseBody);

    // for (Map i in data) {
    //   qrDataList.add(QrData.fromJson(i));
    // }
    return QrData.fromJson(jsonDecode(response.body)[0]);
  } else {
    print('error, \nresponse code : ${response.statusCode}');
    throw Exception('Failed to load data');
  }
}

class QRDataJSON extends StatefulWidget {
  final String qrLink;
  QRDataJSON({Key key, @required this.qrLink}) : super(key: key);
  @override
  _QRDataJSONState createState() => _QRDataJSONState();
}

class _QRDataJSONState extends State<QRDataJSON> {
  QrData qr = QrData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "QR scanner",
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            color: Colors.grey[100]),
        child: Column(
          children: [
            Container(
              child: FutureBuilder(
                future: fetchJSON(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 25, bottom: 25),
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1.0),
                                  child: Text(
                                    'Order Details',
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  height: 10,
                                ),
                                CustomerProperty(
                                    propertyName: 'Name:',
                                    value: snapshot.data.nameAr),
                                CustomerProperty(
                                    propertyName: 'email:',
                                    value: snapshot.data.email),
                                CustomerProperty(
                                    propertyName: 'phone:',
                                    value: snapshot.data.phone),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomerProperty(
                                        propertyName: 'Order date:',
                                        value: snapshot.data.orderDate),
                                    CustomerProperty(
                                        propertyName: 'Invoice ID:',
                                        value: snapshot.data.invoiceID),
                                  ],
                                ),
                                Container(
                                  width: 700,
                                  color: Colors.lightGreen[500],
                                  child: CustomerProperty(
                                      propertyName: 'Payement status:',
                                      value: snapshot.data.paymentStatues),
                                ),
                                CustomerProperty(
                                    propertyName: 'Subtotal:',
                                    value: snapshot.data.subTotal),
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomerProperty(
                                      propertyName: 'code:',
                                      value: snapshot.data.code),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 200, bottom: 289),
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ),
              // child: new ListView.builder(
              //     itemCount: qrDataList.length,
              //     itemBuilder: (context, i) {
              //       final jsonDataList = qrDataList[i];
              //       return Container(
              //         child: Text(
              //             'Company ID: ${jsonDataList.companyId}\n name: ${jsonDataList.email}'),
              //       );
              //     }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(
                width: 110.0,
                height: 70.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AppQR()));
                  },
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: const Text(
                    'home',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final TextStyle stylu = TextStyle(
    fontSize: 15.0,
    fontFamily: 'RobotMono',
    fontWeight: FontWeight.bold,
    color: Colors.black);

final TextStyle stylee =
    TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300, color: Colors.black);

class CustomerProperty extends StatelessWidget {
  final String propertyName;
  final String value;

  const CustomerProperty({
    @required this.propertyName,
    @required this.value,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 5,
          runSpacing: 5,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${this.propertyName}', style: stylee),
            Text(
              '${this.value.replaceAll(new RegExp(r'[^\w\s]+'), '')}',
              style: stylu,
            )
          ],
        ),
      ),
    );
  }
}
