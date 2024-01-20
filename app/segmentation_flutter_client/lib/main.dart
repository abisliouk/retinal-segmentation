import 'package:flutter/material.dart';
import 'services/services.dart' as services;
import 'package:segmentation_flutter_client/screens/image_processing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await services.configureServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const ImageProcessing();
  }
}
