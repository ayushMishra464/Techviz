
import 'package:go_router/go_router.dart';
import 'package:techviz/homeView.dart';
import 'package:techviz/login.dart';


class AppRouter {
    final router = GoRouter(
        initialLocation: "/",
        routes: [
            GoRoute(path: '/',
            name: 'login',
            builder: (globalContext,state) => LoginPage()),
            GoRoute(path: '/homeView',
                name: 'home',
                builder: (globalContext,state) => homeView())
        ]);

}