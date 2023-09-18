import 'package:flutter/material.dart';
import 'package:tab_order_taking/pages/home.dart';
import 'package:tab_order_taking/pages/login.dart';
import 'package:hive/hive.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'models/hive_model.dart';

const Color primaryColor = Color(0xFF3f4c54);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dirPath = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dirPath.path);
  Hive.registerAdapter(MyDataAdapter());

  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/login',
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const Login();
            },
          ),
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const Home();
            },
          ),
        ],
      ),
    );
  }
}
