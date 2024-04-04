import 'package:basic/authentication/firebase_auth.dart';
import 'package:basic/authentication_pages/form_container_widget.dart';
import 'package:basic/authentication_pages/login.dart';
import 'package:basic/main_menu/main_menu_screen.dart';
import 'package:basic/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool currentlySigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Focus Fighters"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign Up", style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold), 
          ),
          SizedBox(
            height: 30,
            ),
            FormContainerWidget(
              controller: _usernameController,
              hintText: "Username",
              isPasswordField: false,
            ),
            SizedBox(
              height: 10,
              ),  
            FormContainerWidget(
              controller: _emailController,
              hintText: "Email",
              isPasswordField: false,
            ),
            SizedBox(
              height: 10,
              ),
            FormContainerWidget(
              controller: _passwordController,
              hintText: "Password",
              isPasswordField: true,
            ),
            SizedBox(
              height: 10,
              ),
            GestureDetector(
              onTap: (){
                _signUp();
              },
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: currentlySigningUp ? CircularProgressIndicator(color: Colors.white,):Text(
                  "Sign Up", style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold),
            )),
            ),
            ),
                  SizedBox(height: 20,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                        },
                        child: Text("Login", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      )
                    ],
                    )
        ],
      ),
      ),
      ),
    );
  }



void _signUp() async {

setState(() {
  currentlySigningUp = true;
});

  String username = _usernameController.text;
  String email = _emailController.text;
  String password = _passwordController.text;

  User? user = await _auth.emailAndPassSignUp(email, password);

setState(() {
  currentlySigningUp = false;
});

  if (user != null) {
    showToast(message: "User $username has been successfully created");
    Navigator.pushNamed(context, "/login", arguments: {'username': username});
  } else {
    showToast(message: "Error");
  }
  }
}