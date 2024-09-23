import 'package:flutter/material.dart';
import 'package:mad2/routes.dart';
import 'package:mad2/services/firebase_auth_service.dart';
import 'package:mad2/widgets/logo_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController _username =  TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        elevation: 5,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          LogoWidget(),
          _usernameTextField,
          _passwordTextField,
          _registerButton,
          _navigateToLogin
        ],
      ),
    );
  }

  Widget get _usernameTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _username,
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle),
          hintText: "Username"
        ),
      ),
    );
  }

  Widget get _passwordTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _password,
        decoration: InputDecoration(
            icon: Icon(Icons.password),
            hintText: "Password"
        ),
      ),
    );
  }
  
  Widget get _registerButton {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 40,
          child: ElevatedButton(
              onPressed: (){
                registerClick();
              },
              child: Text("Register")),
      ),
    );
  }

  Widget get _navigateToLogin{
    return TextButton(onPressed: (){
      RouteGenerator.key.currentState!.pushNamed(RouteGenerator.loginScreen);
    }, child: Text("Have account already, Please login"));
  }

  void registerClick(){
      final firebaseAuthService = FirebaseAuthService();

      String username = _username.text;
      String password = _password.text;
      print("Username : $username , Password : $password");

      firebaseAuthService.registerWithEmail(username, password)
          .then((userCredential){
            print("Success : $userCredential");
      })
          .catchError((error){
            print("$error");
      });

  }
}
