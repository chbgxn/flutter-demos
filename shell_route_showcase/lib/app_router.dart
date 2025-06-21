import 'package:go_router/go_router.dart';
import 'package:shell_route_showcase/screens/home_screen.dart';
import 'package:shell_route_showcase/screens/list_order_screen.dart';
import 'package:shell_route_showcase/screens/pickup_screen.dart';
import 'package:shell_route_showcase/screens/profile_screen.dart';
import 'package:shell_route_showcase/screens/takeout_screen.dart';
import 'package:shell_route_showcase/widgets/app_shell.dart';
import 'package:shell_route_showcase/widgets/order_scaffold.dart';

class AppRouter {
  static final home = '/';
  static final order = '/order';
  static final pickup = '/order/pickup';
  static final takeout = '/order/takeout';
  static final listOrder = '/listOrder';
  static final profile = '/profile';

  static final _routes = [
    ShellRoute(
      builder: (context, state, child) => AppShell(
        currentLocation: state.matchedLocation, 
        child: child
      ),
      routes: [
        GoRoute(
          path: home,
          builder: (_, state) => const HomeScreen(),
        ),
        ShellRoute(
          builder: (_, state, child) => OrderScaffold(
            orderType: _getOrderType(state.matchedLocation),
            child: child
          ),
          routes: [
            GoRoute(
              path: pickup,
              builder: (_, state) => const PickupScreen(),
            ),
            GoRoute(
              path: takeout,
              builder: (_, state) => const TakeoutScreen(),
            )
          ]
        ),
        GoRoute(
          path: listOrder,
          builder: (_, state) => const ListOrderScreen(),
        ),
        GoRoute(
          path: profile,
          builder: (_, state) => const ProfileScreen(),
        ),
      ]
    )
  ];

  static final router = GoRouter(
    initialLocation: home,
    routes: _routes
  );
}

OrderType _getOrderType(String location){
  if(location.contains('pickup')) return OrderType.pickup;
  if(location.contains('takeout')) return OrderType.takeout;
  return OrderType.pickup;
}