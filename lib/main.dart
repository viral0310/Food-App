import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_handler/veiws/screens/add_page.dart';
import 'package:state_handler/veiws/screens/homepage.dart';
import 'package:state_handler/veiws/screens/last_food_page.dart';
import 'package:state_handler/veiws/screens/log_in.dart';
import 'package:state_handler/veiws/screens/sign_in.dart';
import 'package:state_handler/veiws/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const Home(),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
        ),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/splash_screen',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/log_in',
          page: () => const LogIn(),
        ),
        GetPage(
          name: '/sign_in',
          page: () => const SignIn(),
        ),
        GetPage(
          name: '/add_page',
          page: () => const AddPage(),
        ),
        GetPage(
          name: '/last_food',
          page: () => const LastFood(),
        ),
      ],
    );
  }
}
