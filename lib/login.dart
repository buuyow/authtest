import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'screens.dart';

extension StringEx on String {
  bool get IsEmail => this.contains("@");
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future SignIn() async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailController,
                    // keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "email",
                      fillColor: Colors.white,
                    ),
                  ),
                  // validator: (value) {
                  //   if (value != null) {
                  //     if (value.isEmpty) {
                  //       return "email is required";
                  //     }
                  //     if (!value.IsEmail) {
                  //       return "invalid email";
                  //     }
                  //   }
                  // },
                  //onSaved: (newValue) => email = newValue),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    // keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "password",
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget your Password ?"),
                      IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => ForgetScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ))
                    ],
                  ),
                  // CostomButton(
                  //   // onpressed: () {
                  //   // _formKey.currentState!.save();
                  //   // if (_formKey.currentState!.validate()) {
                  //   //   ScaffoldMessenger.of(context).showSnackBar(
                  //   //       SnackBar(content: Text("is being validated")));
                  //   //}
                  //   // ;
                  //   // },
                  //   onpressed: () async {
                  //     await FirebaseAuth.instance
                  //         .signInWithEmailAndPassword(
                  //             email: emailController.text.trim(),
                  //             password: passwordController.text.trim());
                  //   },
                  // ),
                  ElevatedButton(onPressed: SignIn, child: Text("Login"))
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text("Or Login with Social Media acouts"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SocialButton.appleButtonCircle(
                          //     onTap: () {}),
                          // SocialButton.facebookButtonCircle(
                          //     onTap: () {}),
                          // SocialButton.googleButtonCircle(
                          //     onTap: () {}),
                          // SocialButton.twitterButtonCircle(
                          //     onTap: () {}),
                          // SocialButton.linkedinButtonCircle(
                          //     onTap: () {}),
                          // SocialButton.whatsappButtonCircle(
                          //     onTap: () {}),
                          // SocialButton.githubButtonCircle(
                          //     onTap: () {}),
                          // SocialButton.phoneButtonCircle(
                          //     onTap: () {}),
                          FlutterSocialButton(
                            onTap: () {},
                            mini: true,
                            buttonType: ButtonType.google,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FlutterSocialButton(
                            onTap: () {},
                            mini: true,
                            buttonType: ButtonType.facebook,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// class CostomButton extends StatelessWidget {
//   const CostomButton({
//     super.key,
//     this.onpressed,
//   });
//   final void Function()? onpressed;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       borderRadius: BorderRadius.circular(50),
//       child: InkWell(
//         onTap: onpressed,
//         borderRadius: BorderRadius.circular(50),
//         child: Container(
//           width: double.infinity,
//           height: 56,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//             color: Theme.of(context).primaryColor,
//           ),
//           child: Center(
//               child: Text("Login", style: TextStyle(color: Colors.white))),
//         ),
//       ),
//     );
//   }
// }
