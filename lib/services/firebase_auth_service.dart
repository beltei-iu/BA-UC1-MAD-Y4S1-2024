
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> loginWithEmail(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }catch(error){
      print("Error $error");
      throw("Error $error");
    }
  }

  Future<UserCredential> registerWithEmail(String email,String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }catch(error){
      print("Error $error");
      throw("Error : $error");
    }
  }
}