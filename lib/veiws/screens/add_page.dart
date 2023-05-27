import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/food_controller.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  FoodController foodController = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Place Order",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            flex: 10,
            child: Obx(() => ListView(
                  shrinkWrap: true,
                  children: foodController.addList
                      .map((element) => Card(
                            elevation: 3,
                            child: ListTile(
                              leading: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(element['image']))),
                              ),
                              title: Text(
                                "${element['name']}",
                                style: const TextStyle(color: Colors.red),
                              ),
                              subtitle: Text("Rs. ${element['price']}"),
                              trailing: IconButton(
                                onPressed: () {
                                  foodController.addList.remove(element);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ),
                          ))
                      .toList(),
                )),
          ),
          Expanded(
            flex: 1,
            child: Card(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Quantity",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Obx(
                      () => Text(
                        "${foodController.productLength}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Price",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Obx(
                      () => Text(
                        "${foodController.totalPrice}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Get.snackbar(
                    "Your Order is successfully Ordered..", "wait for Delivery",
                    backgroundColor: Colors.teal, colorText: Colors.white);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 140)),
              child: const Text(
                "Buy Now",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
