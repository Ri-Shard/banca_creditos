import 'package:banca_creditos/presentation/routes.dart';
import 'package:banca_creditos/presentation/widgets/main_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://drhrpasiwxsszrarndih.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRyaHJwYXNpd3hzc3pyYXJuZGloIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE4NDc1NTEsImV4cCI6MjAzNzQyMzU1MX0.6ohqIflDIzLGH0pYLHRPh3we7y82Z2cDo8qoJjNVGww',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banca creditos',
      theme: ThemeData(
        fontFamily: 'Product sans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: appRoutes(),
      initialRoute: '/onboarding',
      initialBinding: MainBinding(),
    );
  }
}
