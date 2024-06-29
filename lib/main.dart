import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/notes_controller.dart';
import 'firebase_options.dart';
import 'services/shared_preferences_service.dart';

import 'views/home_screen.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myFirst',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
      initialBinding: InitialBindings(),
      getPages: [
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
          binding: BindingsBuilder.put(() => NotesController()),
        ),
      ],
    );
  }
}

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SharedPreferencesService(), permanent: true);
  }
}
