enum PaymentStatusItem {
  odemeBekleniyor,
  odendi,
  odenmez,
  iptal,
}

extension PaymentStatusItems on PaymentStatusItem {
  int str() {
    switch (this) {
      case PaymentStatusItem.odemeBekleniyor:
        return 1;
      case PaymentStatusItem.odendi:
        return 2;
      case PaymentStatusItem.odenmez:
        return 3;
      case PaymentStatusItem.iptal:
        return 4;
    }
  }
}
