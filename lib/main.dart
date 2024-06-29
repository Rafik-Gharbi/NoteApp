import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'services/shared_preferences_service.dart';

import 'views/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _initializeBindings();
    return MaterialApp(
      title: 'myFirst',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
      // home: const HomeScreen(),
      // home: const EditScreen(),
    );
  }

  void _initializeBindings() {
    SharedPreferencesService();
  }
}
