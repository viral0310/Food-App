import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/food.dart';
import 'Global.dart';

class FoodController {
  void timer() {
    //splash_screen = timer
    Timer(
      Duration(seconds: 5),
      () {
        Get.toNamed('/log_in');
      },
    );
  }

  //splash_screen = Elevatedbutton onTap
  void goToHomePage() {
    Get.toNamed('/log_in');
  }

  // login logout------------------------------------
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signUpUser(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return user;
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'weak-password':
          print("------------------------------");
          print("password at least 6 character long.");
          print("------------------------------");
          break;
        case "email-already-in-use":
          print("------------------------------");
          print("this user is already exits");
          print("------------------------------");
          break;
      }
    }
  }

  signInUser({required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return user;
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'weak-password':
          print("------------------------------");
          print("password at least 6 character long.");
          print("------------------------------");
          break;
        case "user-not-found":
          print("------------------------------");
          print("this user is not created yet.");
          print("------------------------------");
          break;
      }
    }
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    User? user = userCredential.user;
    return user;
  }

  signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }

  //--------------------cloud-fire-store
  //static final
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference authorRef;
  late CollectionReference countersRef;

  //todo: connectWithStudentsCollection

  void connectWithAuthorCollection({required String nameAuthCollection}) {
    authorRef = firebaseFirestore.collection(nameAuthCollection);
  }

  void connectWithCountersCollection({required String nameCountCollection}) {
    countersRef = firebaseFirestore.collection(nameCountCollection);
  }

//todo:insertRecord
  Future<void> insertRecord(
      {required Map<String, dynamic> data,
      required String nameAuthCollection,
      required String nameCountCollection,
      required String foodCounter,
      required String c}) async {
    connectWithAuthorCollection(nameAuthCollection: nameAuthCollection);
    connectWithCountersCollection(nameCountCollection: nameCountCollection);
    DocumentSnapshot documentSnapshot =
        await countersRef.doc(foodCounter).get();
    Map<String, dynamic> counterData =
        documentSnapshot.data() as Map<String, dynamic>;
    /* Food counterData =
        documentSnapshot.data() as Food;*/
    int counter = counterData[c]; //0
    await authorRef.doc('${++counter}').set(data);
    await countersRef.doc(foodCounter).update({c: counter});
  }

  Stream<QuerySnapshot<Object?>> selectRecord({
    required String nameAuthCollection,
  }) {
    connectWithAuthorCollection(nameAuthCollection: nameAuthCollection);

    return authorRef.snapshots();
  }

//todo: updateRecord

  Future<void> updateRecord(
      {required String id,
      required Map<String, dynamic> updateData,
      required String nameAuthCollection}) async {
    connectWithAuthorCollection(nameAuthCollection: nameAuthCollection);

    await authorRef.doc(id).update(updateData);
  }

//todo: deleteRecord
  Future<void> deleteRecord(
      {required String id, required String nameAuthCollection}) async {
    connectWithAuthorCollection(nameAuthCollection: nameAuthCollection);

    await authorRef.doc(id).delete();
  }

  //------------------------------favorite page
  final RxList<bool> foodlikes = List.filled(Global.foodList.length, true).obs;
  final RxList<bool> fruitlikes = List.filled(Global.foodList.length, true).obs;
  final RxList<bool> veglikes = List.filled(Global.foodList.length, true).obs;
  final RxList<bool> grocerylikes =
      List.filled(Global.foodList.length, true).obs;

  RxList favoriteList = [].obs;
  //--------------------------total price
  RxList addList = [].obs;
  get productLength => addList.length;
  get totalPrice {
    RxInt price = 0.obs;

    for (RxInt i = 0.obs; i < addList.length; i++) {
      price = price + addList[i.value]['price'];
    }
    /* for (Food product in addList) {
      price = price + product.price;
    }*/
    print("-----------------------------");
    print(price);
    print("-------------------------------");
    return price;
  }

  void addProduct({required Food product}) {
    addList.add(product);
  }

  void removeProduct({required Food product}) {
    addList.remove(product);
  }

  //-----------------------------
  List searchResult = [];
  //-----------------------------index of last details page
  RxInt number = 1.obs;

  void increment() {
    number++;
  }

  void decrement() {
    number--;
  }
}
