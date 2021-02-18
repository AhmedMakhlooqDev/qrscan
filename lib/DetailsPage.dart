import 'package:flutter/material.dart';
import 'package:qrscan/qr_scan_page.dart';
import 'main.dart';
import 'UIPrefrences.dart';
import 'API_Preferences.dart';

//List<QrData> qrDataList = [];

class QRDataJSON extends StatefulWidget {
  final String qrLink;
  QRDataJSON({Key key, @required this.qrLink}) : super(key: key);
  @override
  _QRDataJSONState createState() => _QRDataJSONState();
}

class _QRDataJSONState extends State<QRDataJSON> {
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
      body: SingleChildScrollView(
        child: Container(
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
                          padding: const EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Order Details',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        height: 30,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomerProperty(
                                              propertyName: 'Order date',
                                              value: snapshot.data.orderDate),
                                          CustomerProperty(
                                              propertyName: 'Invoice ID',
                                              value: snapshot.data.invoiceID),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Container(
                                          width: double.infinity,
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      CustomerProperty(
                                          propertyName: 'Name',
                                          value: snapshot.data.nameAr),
                                      CustomerProperty(
                                          propertyName: 'email',
                                          value: snapshot.data.email),
                                      CustomerProperty(
                                          propertyName: 'phone',
                                          value: snapshot.data.phone),
                                      CustomerProperty(
                                          propertyName: 'code',
                                          value: snapshot.data.code),
                                      PaymentStatues(
                                        propertyName: 'Payement Statues',
                                        value: snapshot.data.paymentStatues,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: CurrencyProperty(
                                          propertyName: 'Subtotal',
                                          value: snapshot.data.subTotal,
                                          curValue: snapshot.data.currency,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Container(
                                          width: double.infinity,
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Items',
                                  style: TextStyle(fontSize: 20.0),
                                  //textAlign: TextAlign.left,
                                ),
                                FutureBuilder(
                                  future: fetchJSONItems(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 20,
                                        ),
                                        child: Wrap(
                                          //direction: Axis.vertical,
                                          spacing: 5,
                                          children: <Widget>[
                                            ItemRow(
                                                nameEng: snapshot.data.nameEng,
                                                currency:
                                                    snapshot.data.currency,
                                                img: snapshot.data.img,
                                                orgTotal:
                                                    snapshot.data.orgTotal,
                                                quantity:
                                                    snapshot.data.quantity),
                                          ],
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 200, bottom: 289),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    }
                                  },
                                ),
                              ],
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
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: 350.0,
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      qrText = '';
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => AppQR()));
                    },
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    child: const Text(
                      'Confirm Delivery',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
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
      ),
    );
  }
}
