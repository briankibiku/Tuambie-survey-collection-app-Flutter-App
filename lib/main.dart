import 'package:flutter/material.dart' hide Router;
import 'package:tuambie/features/survey/all_surveys.dart';
import 'package:tuambie/router_generator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TuambieApp());
}

class TuambieApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      home: AllSurveysPage(),
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder,
    );
  }
}
