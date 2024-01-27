import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/localisation/local_controller.dart';
import 'package:e_store/core/localisation/translation.dart';
import 'package:e_store/core/services/services.dart';
import 'package:e_store/view/screen/language/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final LocalController localController=Get.put(LocalController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, 
    ]);
    return  GetMaterialApp(
      locale: localController.language,
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      theme:ThemeData(
        fontFamily: "playfairDisplay",
        textTheme: const TextTheme(
        
        displayLarge:TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ,
        bodyLarge: TextStyle(height: 3, color: kOnBoardingFC,),

      ),),
      home: const Languege(),
    );
  }
}
