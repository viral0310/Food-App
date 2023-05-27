import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_handler/controllers/food_controller.dart';
import '../../controllers/Global.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FoodController foodController = Get.put(FoodController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Global.color,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 30),
            child: Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    "SignUp",
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                labelText: "Email"),
                            validator: (val) =>
                                (val!.isEmpty) ? "Enter email first" : null,
                            onSaved: (val) {
                              Global.email = val!;
                            },
                            controller: emailController,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                labelText: "password"),
                            validator: (val) =>
                                (val!.isEmpty) ? "Enter password first" : null,
                            onSaved: (val) {
                              Global.password = val;
                            },
                            controller: passwordController,
                            obscureText: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(color: Color(0xff6a74ce)),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          User? user = await foodController.signUpUser(
                              email: Global.email!, password: Global.password!);
                          if (user != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Sign up Successfully"),
                                backgroundColor: Color(0xffa58fd2),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                            Get.toNamed('/', arguments: user);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Sign Up failed"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }

                          print("-----------------------");
                          print(Global.email);
                          print(Global.password);
                          print("------------------------");
                          setState(
                            () {
                              emailController.clear();
                              passwordController.clear();
                              Global.email = "";
                              Global.password = "";
                              // Navigator.of(context).pop();
                            },
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.ubuntu(
                              color: Global.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Forgot your password?",
                    style: GoogleFonts.ubuntu(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Connect with us",
                    style: GoogleFonts.ubuntu(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: GestureDetector(
                      onTap: () async {
                        User? user = await foodController.signInWithGoogle();
                        if (user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login Successfully\n${user.uid}"),
                              backgroundColor: const Color(0xffa58fd2),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          Navigator.of(context)
                              .pushReplacementNamed('/home', arguments: user);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Log In failed"),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              "Log In With Google",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "already have an account? ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "log In",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
