import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:state_handler/models/fruits.dart';
import 'package:state_handler/models/vegetable.dart';

import '../models/Grocery.dart';
import '../models/drawer.dart';
import '../models/food.dart';

class Global {
  static String? email;
  static String? password;
  static Color color = Colors.teal;
  static List<DrawerModel> drawerList = [
    DrawerModel(icon: Icons.person, name: "Profile"),
    DrawerModel(icon: Icons.add_shopping_cart, name: "Cart"),
    DrawerModel(icon: Icons.shop, name: "Order"),
    DrawerModel(icon: Icons.lock, name: "Change"),
    DrawerModel(icon: Icons.exit_to_app, name: "Log Out"),
  ];
  static List<Food> foodList = [
    Food(
        name: 'Pizza',
        image: 'https://freepngimg.com/thumb/pizza/2-pizza-png-image.png',
        price: 1200,
        time: '20min',
        isFavorite: false,
        rate: 4.5),
    Food(
        name: 'Burger',
        image: 'https://www.dlf.pt/dfpng/maxpng/370-3702980_hamburger-png.png',
        price: 1200,
        time: '20min',
        isFavorite: false,
        rate: 4.5),
    Food(
        name: 'Sandwich',
        image:
            'https://pluspng.com/img-png/sandwich-hd-png-sandwich-png-image-2594.png',
        price: 200,
        time: '20min',
        isFavorite: false,
        rate: 4.3),
    Food(
        name: 'Burger',
        image:
            'https://tse1.mm.bing.net/th?id=OIP.387PojRI5pukjUndARHSuAHaE8&pid=Api&P=0',
        price: 1200,
        time: '20min',
        isFavorite: false,
        rate: 4.5),
    Food(
        name: 'Pizza',
        image:
            'https://www.franchiseelites.com/wp-content/uploads/2017/08/Pizza-Free-PNG-Image1.png',
        price: 450,
        time: '12min',
        isFavorite: false,
        rate: 4.3),
    Food(
        name: 'Burger',
        image:
            'https://purepng.com/public/uploads/medium/purepng.com-fast-food-burgerburgerfast-foodhammeatfast-food-burgermc-donaldsburger-king-231519340201mh7zr.png',
        price: 200,
        time: '3min',
        isFavorite: false,
        rate: 4.7),
  ];

  static List<Fruits> fruitsList = [
    Fruits(
        name: 'Apple',
        image:
            'https://freepngimg.com/download/apple/20-green-apples-png-image.png',
        price: 250,
        time: '10min',
        isFavorite: false,
        rate: 5),
    Fruits(
        name: 'Banana',
        image:
            'https://www.pngpix.com/wp-content/uploads/2016/03/Bunch-of-Bananas-PNG-image.png',
        price: 120,
        time: '10min',
        isFavorite: false,
        rate: 4.1),
    Fruits(
        name: 'Grepes',
        image:
            'https://purepng.com/public/uploads/large/purepng.com-grapesgrapeberryfruitwine-331522414914lrzvf.png',
        price: 250,
        time: '10min',
        isFavorite: false,
        rate: 5),
    Fruits(
        name: 'Dragon-Fruits',
        image:
            'http://good-fortune.2u.life/content/images/thumbs/0001255_-red-dragon-fruit-08-1lb_550.png',
        price: 110,
        time: '10min',
        isFavorite: false,
        rate: 5),
    Fruits(
        name: 'Painpple',
        image:
            'https://freepngimg.com/thumb/pineapple/2-2-pineapple-picture.png',
        price: 250,
        time: '10min',
        isFavorite: false,
        rate: 5),
    Fruits(
        name: 'Orange',
        image:
            "https://purepng.com/public/uploads/large/purepng.com-orangesorangefruitfoodtastydeliciousorangecolor-3315225826354ezzx.png",
        price: 250,
        time: '10min',
        isFavorite: false,
        rate: 5),
  ];
  //vegetables
  static List<Vegetable> VegetableList = [
    Vegetable(
        name: 'Acorn squash',
        image: 'https://www.pngmart.com/files/5/Acorn-Squash-PNG-Image.png',
        price: 120,
        time: '5min',
        isFavorite: false,
        rate: 4.1),
    Vegetable(
        name: 'Bitter melon',
        image:
            'https://purepng.com/public/uploads/large/purepng.com-bitter-gourdvegetables-bitter-melon-bitter-gourd-momordica-charantia-bitter-squash-balsam-pear-941524726197qszna.png',
        price: 110,
        time: '2min',
        isFavorite: false,
        rate: 4.2),
    Vegetable(
        name: 'Butternut squash',
        image:
            'https://www.buildingblockassociates.com/uploads/2/0/3/6/20363055/s988221189447504472_p24_i1_w1600.png',
        price: 130,
        time: '10min',
        isFavorite: false,
        rate: 4.3),
    Vegetable(
        name: 'Delicata',
        image:
            'https://www.localseeds.com.au/wp-content/uploads/2020/07/squash.png',
        price: 140,
        time: '5min',
        isFavorite: false,
        rate: 4.4),
    Vegetable(
        name: 'Gem squash',
        image: 'https://www.pngmart.com/files/5/Acorn-Squash-PNG-Pic.png',
        price: 150,
        time: '6min',
        isFavorite: false,
        rate: 4.5),
    Vegetable(
        name: 'Marrow',
        image: 'https://pngimg.com/uploads/marrow/marrow_PNG12.png',
        price: 200,
        time: '11min',
        isFavorite: false,
        rate: 4.6),
  ];
  static List<Grocery> groceryList = [
    Grocery(
        name: 'Chips',
        image:
            'https://tse1.mm.bing.net/th?id=OIP.DUiM0CXaOhCGb2RhaWITOgHaE7&pid=Api&P=0',
        price: 100,
        time: "5min",
        isFavorite: false,
        rate: 4.5),
    Grocery(
        name: 'Doritos chips',
        image:
            'https://tse1.mm.bing.net/th?id=OIP.H6S1JEnGi_Lp-8kxTY_ZUwHaHa&pid=Api&P=0',
        price: 40,
        time: '7min',
        isFavorite: false,
        rate: 5),
    Grocery(
        name: 'Lays chips',
        image:
            'https://tse1.mm.bing.net/th?id=OIP.hK9xXefrtzf_sG0TlT45YwHaEs&pid=Api&P=0',
        price: 30,
        time: '2min',
        isFavorite: false,
        rate: 4.3),
    Grocery(
        name: 'Cookies',
        image:
            'https://tse3.mm.bing.net/th?id=OIP.ZLj9MYZhVWqnhVUMNx0WyQHaEj&pid=Api&P=0',
        price: 50,
        time: '10min',
        isFavorite: false,
        rate: 5),
    Grocery(
        name: 'Potato chips',
        image:
            'https://tse1.mm.bing.net/th?id=OIP.dzYb1OwbP3COIvbvgypqNgAAAA&pid=Api&P=0',
        price: 20,
        time: '20min',
        isFavorite: false,
        rate: 4.0),
    Grocery(
        name: 'Terra chips',
        image:
            'https://tse1.mm.bing.net/th?id=OIP.lXqWGqkGdbd0ZVqIZugf-gHaE8&pid=Api&P=0',
        price: 60,
        time: '5min',
        isFavorite: false,
        rate: 5),
  ];
}
