import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:brand_creator_collab/services/auth_service.dart';
import 'package:brand_creator_collab/screens/login_screen.dart';
import 'package:brand_creator_collab/screens/brand_dashboard.dart';
import 'package:brand_creator_collab/screens/creator_dashboard.dart';
import 'package:brand_creator_collab/screens/admin_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "YOUR_API_KEY",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "YOUR_APP_ID",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Brand Creator Collaboration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          }
          return FutureBuilder<UserType?>(
            future: authService.getUserType(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                switch (snapshot.data) {
                  case UserType.brand:
                    return const BrandDashboard();
                  case UserType.creator:
                    return const CreatorDashboard();
                  case UserType.admin:
                    return const AdminDashboard();
                  default:
                    return const LoginScreen();
                }
              }
              return const CircularProgressIndicator();
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}