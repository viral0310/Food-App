import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_handler/controllers/food_controller.dart';

import '../../controllers/Global.dart';

class LastFood extends StatefulWidget {
  const LastFood({Key? key}) : super(key: key);

  @override
  State<LastFood> createState() => _LastFoodState();
}

class _LastFoodState extends State<LastFood> {
  int index = 1;
  FoodController foodController = Get.find<FoodController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.color,
      appBar: AppBar(
        backgroundColor: Global.color,
        elevation: 0,
        title: const Text("Food Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                bottom: 1,
                left: 1,
                height: 600,
                width: 390,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 550,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${Get.arguments['name']}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Rs. ${Get.arguments['price']}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(10)),
                            height: 50 - 2,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      foodController.decrement();
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                                Obx(
                                  () => Text(
                                    "${foodController.number}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      foodController.increment();
                                    },
                                    icon: const Icon(Icons.add,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "⭐ ${Get.arguments['rate']}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          const Text(
                            "💧 100 Kcal",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            "🕛 ${Get.arguments['time']}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Text(
                          "           Nutrition information is estimated based on the ingredients and cooking instructions as described in each recipe and is intended to be used for informational purposes only. Please note that nutrition details may vary based on methods of preparation, origin and freshness of ingredients used.",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          foodController.addList.add(Get.arguments);
                          Get.snackbar("Order added to your cart",
                              "Order placed successfully",
                              backgroundColor: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 138)),
                        child: const Text(
                          "Add to cart",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 70,
                height: 250,
                width: 250,
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.network(
                    Get.arguments['image'],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
