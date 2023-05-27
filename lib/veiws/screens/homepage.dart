import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_handler/controllers/food_controller.dart';
import 'package:state_handler/veiws/screens/fruits_details.dart';
import 'package:state_handler/veiws/screens/grocery_details.dart';
import 'package:state_handler/veiws/screens/isFavorite_page.dart';
import 'package:state_handler/veiws/screens/vegetable_details.dart';

import '../../controllers/Global.dart';
import '../../models/food.dart';
import 'food_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> _sKey = GlobalKey();

  FoodController foodController = Get.find<FoodController>();
  int index = 0;
  int _selectedIndexForBottomNavigationBar = 0;
  int _selectedIndexForTabBar = 0;
  void _onItemTappedForBottomNavigationBar(int index) {
    setState(() {
      _selectedIndexForBottomNavigationBar = index;
      _selectedIndexForTabBar = 0;
    });
  }

  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index + 1;
      _selectedIndexForBottomNavigationBar = 0;
    });
  }

  static final List _listOfIconsForBottomNavigationBar = [
    FoodDetails(),
    const Icon(Icons.directions_walk),
    const Icon(Icons.directions_bike),
    const FavoritePage(),
  ];

  static final List _listOfIconsForTabBar = [
    FoodDetails(),
    const FruitsDetails(),
    const VegetableDetails(),
    const GroceryDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _sKey,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Row(
            children: const [
              /* Icon(
                Icons.location_pin,
                color: Colors.black,
              ),*/
              Text(
                "Food App",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
          leading: GestureDetector(
            onTap: () {
              _sKey.currentState!.openDrawer();
            },
            child: Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(Get.arguments!.photoURL)),
              ),
              child: const Text(""),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onChanged: (val) {
                      foodController.searchResult.clear();
                      for (int i = 0; i < Global.foodList.length; i++) {
                        Food data = Global.foodList[i];
                        if (data.name
                            .toLowerCase()
                            .contains(val.toLowerCase())) {
                          foodController.searchResult.add(data);
                        }
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(7),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(Icons.filter_list),
                        ),
                        border: const OutlineInputBorder(),
                        fillColor: Colors.teal.shade100,
                        filled: true),
                  ),
                ),
                TabBar(
                  onTap: _onItemTappedForTabBar,
                  tabs: const [
                    Tab(
                      text: "Food",
                    ),
                    Tab(
                      text: "Fruits",
                    ),
                    Tab(
                      text: "Vegetables",
                    ),
                    Tab(
                      text: "Grocery",
                    ),
                  ],
                  labelPadding: const EdgeInsets.all(2),
                  labelColor: Colors.teal,
                  indicatorColor: Colors.teal,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        body: Center(
            child: _selectedIndexForTabBar == 0
                ? _listOfIconsForBottomNavigationBar
                    .elementAt(_selectedIndexForBottomNavigationBar)
                : _listOfIconsForTabBar.elementAt(_selectedIndexForTabBar - 1)),
        /*TabBarView(children: [
          FoodDetails(name: 'Food'),
          FoodDetails(name: 'Fruits'),
          FoodDetails(name: 'Vegetables'),
          FoodDetails(name: 'Grocery'),
        ]),*/
        /*bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 32,
                ),
                onPressed: () {},
              )),
              Expanded(
                  child: IconButton(
                icon: Icon(
                  Icons.chat_outlined,
                  size: 32,
                ),
                onPressed: () {},
              )),
              Expanded(
                  child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 32,
                ),
                onPressed: () {},
              )),
              Expanded(
                  child: IconButton(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 32,
                ),
                onPressed: () {},
              )),
            ],
          ),
        ),*/
        drawer: Drawer(
          backgroundColor: Colors.teal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.5),
                    ),
                    accountName: (Get.arguments!.displayName != null)
                        ? Text(
                            "Name = ${Get.arguments!.displayName}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          )
                        : const Text(
                            "Name = ---",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                    accountEmail: (Get.arguments!.email != null)
                        ? Text(
                            "Email = ${Get.arguments!.email}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          )
                        : const Text("Email = ---"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          NetworkImage("${Get.arguments!.photoURL}"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: Global.drawerList
                      .map(
                        (e) => SizedBox(
                          height: 50,
                          child: ListTile(
                            leading: Icon(
                              e.icon,
                              size: 30,
                              color: Colors.white,
                            ),
                            title: Text(
                              e.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 80,
          width: 60,
          child: Stack(
            children: [
              Positioned(
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.teal,
                  onPressed: () {
                    Get.toNamed('/add_page');
                  },
                  tooltip: 'increment',
                  elevation: 5,
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      color: Colors.teal,
                      shape: BoxShape.circle),
                  child: Obx(
                    () => Text(
                      "${foodController.productLength}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndexForBottomNavigationBar,
          onTap: _onItemTappedForBottomNavigationBar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                ),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: ""),
          ],
        ),
      ),
    );
  }
}
