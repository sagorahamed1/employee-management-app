import 'package:employee_managment/models/employee_model.dart';

abstract class EmployeeState{}

class EmployeeInitState extends EmployeeState{}

class EmployeeLoadingState extends EmployeeState{}

class EmployeeLoadedState extends EmployeeState{
  List <EmployeeModel>? employee;

  EmployeeLoadedState(this.employee);
}


class EmployeeErrorState extends EmployeeState{
  String errorMessage;

  EmployeeErrorState(this.errorMessage);
}


///=================Create Employee================>
class EmployeePostLoadingStata extends EmployeeState{}


class EmployeePostSuccessState extends EmployeeState{}


class EmployeePostFailedState extends EmployeeState{}



///===============Update Employee==================>>>
class UpdateEmployeeLoadingState extends EmployeeState{}

class UpdateEmployeeSuccessState extends EmployeeState{}

class UpdateEmployeeFailState extends EmployeeState{}