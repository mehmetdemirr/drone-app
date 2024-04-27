import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  const RadialGauge(
      {required this.progressValue,
      super.key,
      required this.progressValueChange});
  final double progressValue;
  final double progressValueChange;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            pointers: <GaugePointer>[
              RangePointer(
                gradient: const SweepGradient(colors: [
                  Colors.white,
                  Color(0xFF55F165),
                ]),
                animationType: AnimationType.ease,

                enableAnimation: true,
                // pointerOffset: -0.05,
                value: progressValue,
                cornerStyle: CornerStyle.endCurve,
                width: 0.1,
                sizeUnit: GaugeSizeUnit.factor,
              ),
              MarkerPointer(
                enableAnimation: true,
                animationType: AnimationType.ease,
                value: progressValue,
                markerType: MarkerType.circle,
                markerHeight: 15,
                markerWidth: 15,
                elevation: 1,
                color: const Color(0xFF55F165),
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0,
                angle: 0,
                widget: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          spreadRadius: 3,
                          blurRadius: 100,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 45,
                            height: 22,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE7F4EE),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                '$progressValueChange%',
                                style: const TextStyle(
                                    color: Color(0xFF0D894F), fontSize: 12),
                              ),
                            ),
                          ),
                          const Text(
                            'Sipariş hızı',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
            showLabels: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 1,
            showTicks: false,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.08,
              cornerStyle: CornerStyle.bothCurve,
              color: Color(0xFFF0F1F3),
              thicknessUnit: GaugeSizeUnit.logicalPixel,
            ),
          ),
        ],
      ),
    );
  }
}
