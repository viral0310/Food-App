import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/food_controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FoodController foodController = Get.put(FoodController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 226,
                maxCrossAxisExtent: 300,
                childAspectRatio: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            children: foodController.favoriteList
                .map((e) => Card(
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: 500,
                        width: 200,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                width: 300,
                                child: Image.network(
                                  e['image'],
                                )),
                            Text(
                              "${e['name']}",
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
                                  "${e['time']}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "⭐ ${e['rate']}",
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
                                  "Rs. ${e['price']}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    foodController.favoriteList.remove(e);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 40,
                                    width: 50,
                                    child: const Icon(
                                      Icons.remove,
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
                    ))
                .toList(),
          )),
    );
  }
}
