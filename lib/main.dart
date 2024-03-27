import 'package:e_store/binding.dart';
import 'package:e_store/core/class/local_noification.dart';
import 'package:e_store/core/localisation/local_controller.dart';
import 'package:e_store/core/localisation/translation.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  await initServices();
  await LocalNotification.init();
    initializeDateFormatting().then((_) => runApp(MyApp()));
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
