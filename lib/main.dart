import 'package:e_store/binding.dart';
import 'package:e_store/core/constants/route.dart';
import 'package:e_store/core/localisation/local_controller.dart';
import 'package:e_store/core/localisation/translation.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LocalController localController = Get.put(LocalController());
  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      initialBinding: MyBinding(),
      locale: localController.language,
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      theme: localController.themeData,
      getPages: routes,
    );
  }
}
