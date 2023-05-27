import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/Global.dart';
import '../../controllers/food_controller.dart';

class VegetableDetails extends StatefulWidget {
  const VegetableDetails({Key? key}) : super(key: key);

  @override
  State<VegetableDetails> createState() => _VegetableDetailsState();
}

class _VegetableDetailsState extends State<VegetableDetails> {
  FoodController foodController = Get.put(FoodController());

  Future getData() async {
    for (int i = 0; i < Global.foodList.length; i++) {
      Map<String, dynamic> data = {
        "image": Global.foodList[i]!.image,
        "name": Global.foodList[i]!.name,
        "isFavorite": Global.foodList[i]!.isFavorite,
        "price": Global.foodList[i]!.price,
        "rate": Global.foodList[i]!.rate,
        "time": Global.foodList[i]!.time
      };
      /*     Food data = Food(
          image: Global.foodList[i].image,
          name: Global.foodList[i].name,
          isFavorite: Global.foodList[i].isFavorite,
          price: Global.foodList[i].price,
          rate: Global.foodList[i].rate,
          time: Global.foodList[i].time);*/
      // CloudFirestoreHelper.cloudFirestoreHelper.insertRecord(data: data);
      foodController.selectRecord(nameAuthCollection: 'Fruits');
      print("---------------------------------------");
      print(data);
      print("--------------------------------------------");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: foodController.selectRecord(nameAuthCollection: 'Vegetables'),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("ERROR : ${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          QuerySnapshot? data = snapshot.data;
          List<QueryDocumentSnapshot> documents = data!.docs;
          return GridView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/last_food', arguments: documents[index]);
                },
                child: Card(
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 500,
                    width: 200,
                    child: Column(
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              foodController.veglikes[index] =
                                  !foodController.veglikes[index];
                              foodController.favoriteList.add(documents[index]);
                              print(foodController.favoriteList);
                            },
                            child: Align(
                                alignment: Alignment.topRight,
                                child: (foodController.veglikes[index])
                                    ? const Icon(Icons.favorite_border)
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )),
                          ),
                        ),
                        Container(
                            height: 100,
                            width: 300,
                            child: Image.network(
                              documents[index]['image'],
                            )),
                        Text(
                          "${documents[index]['name']}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${documents[index]['time']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "⭐ ${documents[index]['rate']}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs. ${documents[index]['price']}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              onTap: () {
                                foodController.addList.add(documents[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 40,
                                width: 50,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 250,
                maxCrossAxisExtent: 300,
                childAspectRatio: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
