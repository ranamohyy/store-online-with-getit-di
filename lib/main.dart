import 'package:flutter/material.dart';
import 'package:implement_clean_code_for_store/core/networking/dio_helper.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Scaffold(),
    );
  }
}
