import 'package:firebase_login/models/user.dart';
import 'package:firebase_login/screens/wrapper.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<CustomUser?>.value(
            catchError: (_, __) => null,
            initialData: CustomUser(uid: 'Null'),
            value: AuthService().user)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey.shade900),
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.grey.shade400,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
