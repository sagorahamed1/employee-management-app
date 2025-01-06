abstract class EmployeeEvent{}

class GetEmployee extends EmployeeEvent{}

class CreateEmployee extends EmployeeEvent {
  final Map<String, dynamic> employeeData;
  CreateEmployee(this.employeeData);
}


class UpdateEmployeeEvent extends EmployeeEvent{
  final String id;
  final Map<String, dynamic> employeeUpdateDate;
  UpdateEmployeeEvent( this.employeeUpdateDate,{required this.id});
}