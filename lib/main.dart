import 'package:tfc_vend_18_5h/bidings/auth_binding.dart';
import 'package:tfc_vend_18_5h/utils/root.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      title: 'tfc_vend_18_5h',
      theme: ThemeData(
        textTheme:
            GoogleFonts.yanoneKaffeesatzTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Root(),
      initialRoute: '/',
      routes: {
        'auth': (context) => AuthScreen(),
        'settings': (context) => tfc_vend_18_5h(),
        'profile': (context) => tfc_vend_18_5h(),
        'create_vote': (context) => NewVote(),
      },
    );
  }
}

// class tfc_vend_18_5h extends StatefulWidget {
//   @override
//   _tfc_vend_18_5hState createState() => _tfc_vend_18_5hState();
// }

// class _tfc_vend_18_5hState extends State<tfc_vend_18_5h> {
//   final GlobalKey _scafflofKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo[100],
//       key: _scafflofKey,
//       appBar: AppBar(
//         //  leading: IconButton(
//         //   icon: Icon(Icons.dashboard),
//         //  onPressed: () {
//         //     Scaffold.of(context).openDrawer();
//         // }),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: <Color>[Colors.indigo, Colors.blue])),
//         ),
//         elevation: 0.0,
//         title: Shimmer.fromColors(
//           baseColor: Colors.white,
//           highlightColor: Colors.blue,
//           child: Text('tfc_vend_18_5h',
//               style: GoogleFonts.loversQuarrel(
//                   fontSize: 48.0, fontWeight: FontWeight.bold)),
//         ),
//         actions: [
//           // ignore: missing_required_param

//           IconButton(
//               color: Colors.white,
//               icon: Icon(Icons.how_to_vote_rounded),
//               onPressed: () {}),
//           Container(
//             decoration: BoxDecoration(shape: BoxShape.circle),
//             child: IconButton(
//                 color: Colors.white,
//                 icon: Icon(Icons.info_outline_rounded),
//                 onPressed: () {
//                   showAboutDialog(
//                       context: context,
//                       applicationVersion: '^1.0.0',
//                       applicationIcon: CircleAvatar(
//                         radius: 30.0,
//                         backgroundColor: Colors.transparent,
//                         backgroundImage: AssetImage('assets/icons/icon.png'),
//                       ),
//                       applicationName: 'tfc_vend_18_5h',
//                       applicationLegalese: 'Brave Tech Solutions');
//                 }),
//           ),
//         ],
//       ),
//       body: HomeScreen(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => print('Floating Action button pressed'),
//         child: Container(
//           decoration: BoxStyles.gradientBox,
//           child: IconButton(
//               icon: Icon(Icons.how_to_vote_rounded),
//               onPressed: () => print('How to vote')),
//         ),
//       ),
//       drawer: CustomDrawer(),
//     );
//   }
// }
