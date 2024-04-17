import 'package:auto_route/auto_route.dart';
import 'package:demo/core/extension/screen_size.dart';
import 'package:demo/core/utilty/images_items.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });
  final int id;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ürün Detay")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  width: context.width - 16,
                  ImageItem.demoProduct.str(),
                ),
                Text(
                  "Ürün Ad",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Ürün Açıklama",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
