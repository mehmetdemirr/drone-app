import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/log/log.dart';
import 'package:demo/core/url_launcher/url_launher_func.dart';
import 'package:demo/product/company_order/service/company_order_service.dart';
import 'package:demo/product/company_order_detail/model/company_order_details_model.dart';
import 'package:demo/product/company_order_detail/viewmodel/company_order_detail_viewmodel.dart';
import 'package:demo/product/general/enum/order_status.dart';
import 'package:demo/product/general/enum/payment_status.dart';
import 'package:demo/product/general/extension/status_to_string.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CompanyOrderDetailScreen extends StatefulWidget {
  const CompanyOrderDetailScreen({super.key, required this.id});
  final int id;
  @override
  State<CompanyOrderDetailScreen> createState() =>
      _CompanyOrderDetailScreenState();
}

class _CompanyOrderDetailScreenState extends State<CompanyOrderDetailScreen> {
  LatLng initialLocationData = const LatLng(0, 0);
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      context.read<CompanyOrderDetailViewModel>().fetchOrderDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sipariş Detayı"),
      ),
      body: context.watch<CompanyOrderDetailViewModel>().isLoading
          ? const Center(
              child: LoadingWidget(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _siparisDurumGuncelle(context
                            .watch<CompanyOrderDetailViewModel>()
                            .orderModel
                            ?.id ??
                        0),
                    _bilgi(context
                        .watch<CompanyOrderDetailViewModel>()
                        .orderModel),
                    const SizedBox(height: 10),
                    Text(
                      "Siparişteki Ürünler",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    _listViewBuilder(
                      context
                              .watch<CompanyOrderDetailViewModel>()
                              .orderModel
                              ?.orderItems ??
                          [],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(child: Text("Konum ")),
                    Center(
                      child: Row(
                        children: [
                          _konumaGitButton(context
                              .watch<CompanyOrderDetailViewModel>()
                              .orderModel),
                          const SizedBox(width: 15),
                          _konumPaylas(context
                              .watch<CompanyOrderDetailViewModel>()
                              .orderModel),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width: context.width,
                      child: _map(
                        context.watch<CompanyOrderDetailViewModel>().orderModel,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  ElevatedButton _konumaGitButton(CompanyOrderDetailModel? orderModel) {
    return ElevatedButton(
      onPressed: () async {
        try {
          await CustomUrlLauncher.openMap(
            context,
            double.parse(orderModel?.locationLatitude ?? "0"),
            double.parse(orderModel?.locationLongitude ?? "0"),
          );
        } catch (e) {
          Log.error("company order detail screen harita yönlendirme hatası");
          EasyLoading.showError(
              "Yönlendirme yapılamadı!\nLütfen tekrar deneyiniz.");
        }
      },
      child: const Text("Konuma Git"),
    );
  }

  Column _siparisDurumGuncelle(int id) {
    return Column(
      children: [
        const Text("order status güncelle"),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                BaseResponse response = await CompanyOrderService()
                    .changeOrderStatus(
                        id,
                        OrderStatusItem.siparisHazirlaniyor
                            .strOrderStatus2Int());
                if (response.succeeded) {
                  EasyLoading.showSuccess(
                      "Sipariş durumu güncellendi ! \nDurum:Hazırlanıyor");
                } else {
                  EasyLoading.showError(
                      "Durum güncellenemedi.Error:${response.errors}-${response.message}");
                }
              },
              child: const Text("hazırla"),
            ),
            ElevatedButton(
              onPressed: () async {
                BaseResponse response = await CompanyOrderService()
                    .changeOrderStatus(
                        id, OrderStatusItem.siparisYolda.strOrderStatus2Int());
                if (response.succeeded) {
                  EasyLoading.showSuccess(
                      "Sipariş durumu güncellendi ! \nDurum:Yolda");
                } else {
                  EasyLoading.showError(
                      "Durum güncellenemedi.Error:${response.errors}-${response.message}");
                }
              },
              child: const Text("Yolda "),
            ),
            ElevatedButton(
              onPressed: () async {
                BaseResponse response = await CompanyOrderService()
                    .changeOrderStatus(
                        id,
                        OrderStatusItem.siparisTeslimEdildi
                            .strOrderStatus2Int());
                if (response.succeeded) {
                  EasyLoading.showSuccess(
                      "Sipariş durumu güncellendi ! \nDurum:Teslim edildi");
                } else {
                  EasyLoading.showError(
                      "Durum güncellenemedi.Error:${response.errors}-${response.message}");
                }
              },
              child: const Text("Teslim edildi"),
            ),
            ElevatedButton(
              onPressed: () async {
                BaseResponse response = await CompanyOrderService()
                    .changeOrderStatus(
                        id, OrderStatusItem.siparisIptal.strOrderStatus2Int());
                if (response.succeeded) {
                  EasyLoading.showSuccess(
                      "Sipariş durumu güncellendi ! \nDurum:İptal");
                } else {
                  EasyLoading.showError(
                      "Durum güncellenemedi.Error:${response.errors}-${response.message}");
                }
              },
              child: const Text("İptal "),
            ),
          ],
        ),
        const Text("payment status güncelle"),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                BaseResponse response = await CompanyOrderService()
                    .changePaymentStatus(id, PaymentStatusItem.odendi.str());
                if (response.succeeded) {
                  EasyLoading.showSuccess(
                      "Ödeme durumu güncellendi ! \nDurum:Ödendi");
                } else {
                  EasyLoading.showError(
                      "Durum güncellenemedi.Error:${response.errors}-${response.message}");
                }
              },
              child: const Text("ödendi"),
            ),
            ElevatedButton(
              onPressed: () async {
                BaseResponse response = await CompanyOrderService()
                    .changePaymentStatus(
                        id, PaymentStatusItem.odemeBekleniyor.str());
                if (response.succeeded) {
                  EasyLoading.showSuccess(
                      "Ödeme durumu güncellendi ! \nDurum:Ödeme bekleniyor");
                } else {
                  EasyLoading.showError(
                      "Durum güncellenemedi.Error:${response.errors}-${response.message}");
                }
              },
              child: const Text("ödenmedi "),
            ),
            ElevatedButton(
              onPressed: () async {
                BaseResponse response = await CompanyOrderService()
                    .changePaymentStatus(id, PaymentStatusItem.iptal.str());
                if (response.succeeded) {
                  EasyLoading.showSuccess(
                      "Ödeme durumu güncellendi ! \nDurum:İptal");
                } else {
                  EasyLoading.showError(
                      "Durum güncellenemedi.Error:${response.errors}-${response.message}");
                }
              },
              child: const Text("iptal"),
            ),
            ElevatedButton(
              onPressed: () async {
                BaseResponse response = await CompanyOrderService()
                    .changePaymentStatus(id, PaymentStatusItem.odenmez.str());
                if (response.succeeded) {
                  EasyLoading.showSuccess(
                      "Ödeme durumu güncellendi ! \nDurum:Ödenmez");
                } else {
                  EasyLoading.showError(
                      "Durum güncellenemedi.Error:${response.errors}-${response.message}");
                }
              },
              child: const Text("ödenmez "),
            ),
          ],
        ),
      ],
    );
  }

  ElevatedButton _konumPaylas(CompanyOrderDetailModel? orderModel) {
    return ElevatedButton(
      onPressed: () async {
        EasyLoading.showInfo("Yakında ...");
        // try {
        //   if (orderModel?.locationLatitude != null &&
        //       orderModel?.locationLongitude != null) {
        //     await CustomSharePlusFunction().share(
        //         double.parse(orderModel?.locationLatitude ?? "0"),
        //         double.parse(orderModel?.locationLongitude ?? "0"));
        //     // EasyLoading.showSuccess(
        //     //     "Konum paylaşılacak (share plus)");
        //   } else {
        //     EasyLoading.showError("Paylaşmada hata oluştu");
        //   }
        // } catch (e) {
        //   Log.error("company order detail screen konum paylaşma hatası");
        //   EasyLoading.showError(
        //       "Paylaşmada hata oluştu!\nLütfen tekrar deneyiniz.Error: ${e.toString()}");
        // }
      },
      child: const Text("Konuma paylaş"),
    );
  }

  Column _bilgi(CompanyOrderDetailModel? orderModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("sipariş id : ${orderModel?.id}"),
        Text(
          "Toplam Tutar : ${orderModel?.totalPrice} TL",
        ),
        Text(
          "Ad - Soyad : ${orderModel?.user.name} ${orderModel?.user.surname}",
        ),
        Text(
          "Kullanıcı mail : ${orderModel?.user.email}",
        ),
        Text(
          "Telefon : ${orderModel?.user.phone}",
        ),
        Text(
          "Açıklama : ${orderModel?.description}",
        ),
        Text(
          "Company Area id : ${orderModel?.companyAreaId}",
        ),
        Text(
          "Sipariş id : ${(int.parse(orderModel?.statusId ?? "0")).int2OrderStatus().strOrderStatus2String()}",
        ),
        Text(
          "Ödeme id : ${int.parse(orderModel?.paymentStatusId ?? "0").int2PaymentStatus().strString()}",
        ),
      ],
    );
  }

  Widget _map(CompanyOrderDetailModel? orderModel) {
    return (orderModel?.locationLatitude == null &&
            orderModel?.locationLatitude == null)
        ? const Text("enlem boylam null geldi")
        : FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(
                double.parse(orderModel!.locationLatitude ??
                    "${initialLocationData.latitude}"),
                double.parse(orderModel.locationLongitude ??
                    "${initialLocationData.longitude}"),
              ),
            ),
            children: [
              TileLayer(
                minZoom: 10,
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                // userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(
                      double.parse(orderModel.locationLatitude ??
                          "${initialLocationData.latitude}"),
                      double.parse(orderModel.locationLongitude ??
                          "${initialLocationData.longitude}"),
                    ),
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
              PolylineLayer(
                polylineCulling: false,
                polylines: [
                  Polyline(
                    points: [],
                    color: Colors.blue,
                    strokeWidth: 100,
                  ),
                ],
              )
            ],
          );
  }

  Widget _listViewBuilder(List<OrderItem> list) {
    return list.isEmpty
        ? const Text("Siparişte ürün bulunamadı !")
        : ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(list[index].title ?? "ürün ad yok"),
                            const Spacer(),
                            Text("${list[index].price ?? "-"} TL"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
