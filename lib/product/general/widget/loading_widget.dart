import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _composition = AssetLottie('assets/jsons/loading.json').load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;
        if (composition != null) {
          return Lottie(composition: composition);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
