import 'package:e_store/binding.dart';
import 'package:e_store/core/class/local_noification.dart';
import 'package:e_store/core/localisation/local_controller.dart';
import 'package:e_store/core/localisation/translation.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC4lt7pmMW0hdB-_5YbyGVvQ2aTwUX5LN0",
            authDomain: "e-store-bddb3.firebaseapp.com",
            projectId: "e-store-bddb3",
            storageBucket: "e-store-bddb3.appspot.com",
            messagingSenderId: "516978080624",
            appId: "1:516978080624:web:261c9c81a234b8545f6db5"));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
   
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
