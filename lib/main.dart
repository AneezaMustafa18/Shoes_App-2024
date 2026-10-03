import 'package:device_preview/device_preview.dart' show DevicePreview;
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/features/cart/presentation/provider/card_provider.dart';
import 'package:shoes_app/features/splash/presentation/screens/startscreen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Startscreen(),
    );
  }
}