import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FacebookAuth facebookAuth = FacebookAuth.instance;
Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  return await firebaseAuth.signInWithCredential(credential);
}

Future signInWithFacebook() async {
  final LoginResult result = await facebookAuth.login();
  if (result.status == LoginStatus.success) {
    try {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      return await firebaseAuth.signInWithCredential(credential);
      // saving the values
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  } else {
    print('no se pudo jejeje');
  }
}
