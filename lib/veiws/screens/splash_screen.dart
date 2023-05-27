import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_handler/controllers/food_controller.dart';

import '../../controllers/Global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FoodController foodController = Get.put(FoodController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodController.timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                height: 250,
                width: 250,
                'assets/Food-Dish-1.png',
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Fast delivery at\nyour doorstep",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Home delivery and online reservation\nsystem for restraurants & cafe",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const Spacer(),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      foodController.goToHomePage();
                    },
                    child: Text(
                      "Let's Explore",
                      style: TextStyle(
                        fontSize: 23,
                        color: Global.color,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
