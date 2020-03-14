import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sew_your_stash/common/keys.dart';
import 'package:sew_your_stash/modules/common/services/local_storage.dart';
import 'package:sew_your_stash/modules/common/services/stashService.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  // final AuthResult authResult = await _auth.signInWithCredential(credential);
  // final FirebaseUser user = authResult.user;
  final FirebaseUser user = await _auth.signInWithCredential(credential);

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  await addValToLocalStorage(googleId, currentUser.uid);
  await addValToLocalStorage(photoUrl, currentUser.photoUrl);
  await addValToLocalStorage(displayName, currentUser.displayName);
  await addValToLocalStorage(email, currentUser.email);
  
  //check if stash exists if it doesn't then create it..
  getStash(currentUser.uid).then((DocumentSnapshot snapshot) => {
    if (!snapshot.exists)
        createStash(currentUser.uid)
  });
  
  return user;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  
  await removeValFromLocalStorage(googleId);
  await removeValFromLocalStorage(photoUrl);
  await removeValFromLocalStorage(displayName);
  await removeValFromLocalStorage(email);

  print("User Sign Out");
}