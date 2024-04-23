import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CustomerWaitingRoomScreen extends StatefulWidget {
  const CustomerWaitingRoomScreen({super.key});
  @override
  State<CustomerWaitingRoomScreen> createState() =>
      _CustomerWaitingRoomScreenState();
}

class _CustomerWaitingRoomScreenState extends State<CustomerWaitingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bekleme Odası"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Şirketin sizi onaylaması için bekliyorsunuz.\nŞirket onayladıktan sonra uygulamayı tekrar açabilirsiniz !",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
