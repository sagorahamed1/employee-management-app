import 'package:employee_managment/pregantaitions/screens/home_screen/home_screen.dart';
import 'package:employee_managment/pregantaitions/screens/login/login_screen.dart';
import 'package:employee_managment/pregantaitions/screens/splash_screen/splash_screen.dart';
import 'package:employee_managment/pregantaitions/screens/update_employee/update_employee_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  ///===================routes Path===================>>>

  static const String splashScreen = "/splashScreen";
  static const String loginScreen = "/loginScreen";
  static const String homeScreen = "/HomeScreen";
  static const String updateEmployeeScreen = "/UpdateEmployeeScreen";

  static final GoRouter goRouter = GoRouter(
    initialLocation: splashScreen,
      routes: [

        ///===================Splash Screen=================>>>
        GoRoute(
            path: splashScreen,
            name: splashScreen,
            builder: (context, state) =>const SplashScreen(),
            redirect: (context, state) {
              Future.delayed(const Duration(seconds: 3), (){
                AppRoutes.goRouter.replaceNamed(AppRoutes.homeScreen);
              });
              return null;
            },
        ),


        GoRoute(
          path: loginScreen,
          name: loginScreen,
          builder: (context, state) =>  LoginScreen(),
        ),


        GoRoute(
          path: homeScreen,
          name: homeScreen,
          builder: (context, state) =>  const HomeScreen(),
        ),


        GoRoute(
          path: updateEmployeeScreen,
          name: updateEmployeeScreen,
          builder: (context, state) {
            final String id = state.extra as String;
           return UpdateEmployeeScreen(id: id);},
        ),
      ]
  );
}
