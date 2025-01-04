abstract class EmployeeEvent{}

class GetEmployee extends EmployeeEvent{}

class CreateEmployee extends EmployeeEvent {
  final Map<String, dynamic> employeeData;
  CreateEmployee(this.employeeData);
}