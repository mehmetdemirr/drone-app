import 'package:demo/product/general/enum/order_status.dart';
import 'package:demo/product/general/enum/payment_status.dart';

extension StatusExtension on int {
  OrderStatusItem int2OrderStatus() {
    switch (this) {
      case 0:
        return OrderStatusItem.tumu;
      case 1:
        return OrderStatusItem.sepette;
      case 2:
        return OrderStatusItem.siparisVerildi;
      case 3:
        return OrderStatusItem.siparisHazirlaniyor;
      case 4:
        return OrderStatusItem.siparisYolda;
      case 5:
        return OrderStatusItem.siparisTeslimEdildi;
      case 6:
        return OrderStatusItem.siparisIptal;
      default:
        return OrderStatusItem.tumu;
    }
  }

  PaymentStatusItem int2PaymentStatus() {
    switch (this) {
      case 1:
        return PaymentStatusItem.odemeBekleniyor;
      case 2:
        return PaymentStatusItem.odendi;
      case 3:
        return PaymentStatusItem.odenmez;
      case 4:
        return PaymentStatusItem.iptal;
      default:
        return PaymentStatusItem.odemeBekleniyor;
    }
  }
}
