import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class QrData {
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
  String nameEng;

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
      this.orderDate,
      this.nameEng});

  factory QrData.fromJson(Map<String, dynamic> responseJSON) => QrData(
        companyId: responseJSON['company_id'],
        code: responseJSON['code'],
        nameAr: responseJSON['name_en'],
        phone: responseJSON['phone'],
        email: responseJSON['email'],
        currency: responseJSON['currency'],
        subTotal: responseJSON['sub_total'],
        invoiceID: responseJSON['gatee_payment_id'],
        paymentStatues: responseJSON['status'],
        orderDate: responseJSON['order_date'],
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
}
