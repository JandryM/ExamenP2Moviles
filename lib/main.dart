import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/get_data/get_data_bloc.dart';
import 'bloc/enter_data/enter_data_bloc.dart';
import 'screens/login_screen.dart';
import 'screens/get_data_screen.dart';
import 'screens/enter_data_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(FirebaseAuth.instance)),
        BlocProvider(create: (context) => GetDataBloc()),
        BlocProvider(create: (context) => EnterDataBloc()), // Nuevo BloC
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cine App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? '/login'
            : '/get-data',
        routes: {
          '/login': (context) => LoginScreen(),
          '/get-data': (context) => const DataListScreen(),
          '/add-data': (context) => const EnterDataScreen(), // Nueva ruta
        },
      ),
    );
  }
}
