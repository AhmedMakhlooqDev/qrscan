import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class QrData extends StatelessWidget {
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

  QrData(
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

  factory QrData.fromJson(Map<String, dynamic> json) => QrData(
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

  Map<String, dynamic> toJson() {
    return {
      "company_id": companyId,
      "code": code,
      "name_ar": nameAr,
      "phone": phone,
      "email": email,
      "currency": currency,
      "sub_total": subTotal,
      "gatee_invoice_id": invoiceID,
      "status": paymentStatues,
      "order_date": orderDate,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
