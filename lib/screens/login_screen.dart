import 'package:flutter/material.dart';
import 'package:mad2/routes.dart';
import 'package:mad2/services/firebase_auth_service.dart';
import 'package:mad2/widgets/logo_widget.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView(
        children: [
          LogoWidget(),
          _usernameTextField,
          _passwordTextField,
          _loginButton,
          _navigateToRegister
        ],
      )
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

  Widget get _loginButton {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 40,
        child: ElevatedButton(
            onPressed: (){
              loginHandleClick();
            },
            child: Text("Login")),
      ),
    );
  }

  Widget get _navigateToRegister {
    return TextButton(onPressed: (){
      RouteGenerator.key.currentState!.pushNamed(RouteGenerator.registerScreen);
    }, child: Text("Don't have account, Please register"));
  }

  loginHandleClick(){

    final firebaseAuthService = FirebaseAuthService();

    String username = _username.text;
    String password = _password.text;

    firebaseAuthService.loginWithEmail(username, password)
    .then((user){

      final alert = AlertDialog(
        title: Icon(Icons.check_circle, color: Colors.green, size: 25,),
        content: Text("Login successed"),
        actions: [
          TextButton(onPressed: (){
            RouteGenerator.key.currentState!.pushReplacementNamed(RouteGenerator.homePage);
          }, child: Text("OK"))
        ],
      );
      showDialog(context: context, builder: (BuildContext context) => alert);

    }).catchError((error){
      final alert = AlertDialog(
        title: Icon(Icons.cancel, color: Colors.red, size: 25,),
        content: Text("Login failured"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("OK"))
        ],
      );
      showDialog(context: context, builder: (BuildContext context) => alert);

    });


  }

}
