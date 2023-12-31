// import 'package:tfc_vend_18_5h/models/models.dart';
// import 'package:tfc_vend_18_5h/services/database.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tfc_vend_18_5h/controllers/controllers.dart';

// class AuthController extends GetxController {
//   var message = "Error";
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   Rx<User> _firebaseUser = Rx<User>();
//   var usercontroller = Get.put(UserController());

//   String? get user => _firebaseUser.value.email;

//   @override
//   void onInit() {
//     super.onInit();
//     _firebaseUser.bindStream(_auth.authStateChanges());
//   }

//   void createUser(imgURL, name, phoneNumber, email, password) async {
//     try {
//       var _authResult = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       //Creation d'un utilisateur sur firestore
//       UserModel _user = UserModel(
//           id: _authResult.user!.uid,
//           avatar: imgURL,
//           name: name,
//           phoneNumber: phoneNumber,
//           email: email,
//           ownedElections: []);
//       if (await DataBase().createNewUser(_user)) {
//         Get.find<UserController>().user = _user;
//         Get.back();
//       }
//     } catch (err) {
//       Get.snackbar('Processing Error', err.toString());
//     }
//   }

//   void loginUser(String email, String password) async {
//     try {
//       var _authResult = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);

//       Get.find<UserController>().user =
//           await DataBase().getUser(_authResult.user!.uid);
//       Get.back();
//     } catch (err) {
//       Get.snackbar('Processing Error', err.message);
//     }
//   }

//   void signOut() {
//     try {
//       _auth.signOut();
//       Get.find<UserController>().clear();
//     } catch (err) {
//       Get.snackbar('Erreur d\'enregistremen ', err.message);
//     }
//   }
// }
