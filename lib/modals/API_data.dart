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

//-----------------------------------------------------------------------------------------------
class ItemData {
  String currency;
  String nameEng;
  String quantity;
  String orgTotal;
  String img;

  ItemData(
      {this.currency, this.nameEng, this.quantity, this.orgTotal, this.img});

  factory ItemData.fromJson(Map<String, dynamic> responseJSON) => ItemData(
      currency: responseJSON['currency'],
      nameEng: responseJSON['name_en'],
      img: responseJSON['square_image'],
      quantity: responseJSON['quantity'],
      orgTotal: responseJSON['original_total']);

  Map<String, dynamic> toJson() {
    return {
      "currency": currency,
      "name_en": nameEng,
      "square_image": img,
      "quantity": quantity,
      "original_total": orgTotal,
    };
  }
}
