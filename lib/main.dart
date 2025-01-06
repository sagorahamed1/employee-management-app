import 'package:employee_managment/bloc/emplyee/employee_bloc.dart';
import 'package:employee_managment/core/routes/app_routes.dart';
import 'package:employee_managment/helpers/dio_helper.dart';
import 'package:employee_managment/helpers/dio_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init(baseUrl: "https://6778f440482f42b62e9003be.mockapi.io/employee");
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmployeeBloc(getDataProvider: DioDataProvider(dio: DioHelper.dio)))
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRoutes.goRouter.routeInformationParser,
      routeInformationProvider: AppRoutes.goRouter.routeInformationProvider,
      routerDelegate: AppRoutes.goRouter.routerDelegate,
    );
  }
}
