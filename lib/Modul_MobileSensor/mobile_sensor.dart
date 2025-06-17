import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  String _accelerometer = 'Menunggu data...';
  String _gyroscope = 'Menunggu data...';

  StreamSubscription<AccelerometerEvent>? _accelSub;
  StreamSubscription<GyroscopeEvent>? _gyroSub;

  @override
  void initState() {
    super.initState();

    // Menggunakan stream baru dari sensors_plus
    _accelSub = SensorsPlatform.instance.accelerometerEventStream().listen((
      event,
    ) {
      setState(() {
        _accelerometer =
            'X: ${event.x.toStringAsFixed(2)}, '
            'Y: ${event.y.toStringAsFixed(2)}, '
            'Z: ${event.z.toStringAsFixed(2)}';
      });
    });

    _gyroSub = SensorsPlatform.instance.gyroscopeEventStream().listen((event) {
      setState(() {
        _gyroscope =
            'X: ${event.x.toStringAsFixed(2)}, '
            'Y: ${event.y.toStringAsFixed(2)}, '
            'Z: ${event.z.toStringAsFixed(2)}';
      });
    });
  }

  @override
  void dispose() {
    _accelSub?.cancel();
    _gyroSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sensor & Spesifikasi Teknis')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Accelerometer:',

              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(_accelerometer),

            const SizedBox(height: 20),

            const Text(
              'Gyroscope:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(_gyroscope),
          ],
        ),
      ),
    );
  }
}
