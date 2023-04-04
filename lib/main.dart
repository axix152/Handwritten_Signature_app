import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:signature_forgery_detection/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:signature_forgery_detection/src/utils/theme/theme.dart';

import 'firebase_options.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme_Class.lightTheme,
      darkTheme: Theme_Class.darkTheme,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 2),
      home: const SplashScreen(),
    );
  }
}
