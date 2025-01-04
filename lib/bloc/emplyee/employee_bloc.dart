import 'package:employee_managment/bloc/emplyee/employee_event.dart';
import 'package:employee_managment/bloc/emplyee/employee_state.dart';
import 'package:employee_managment/helpers/get_data_provider.dart';
import 'package:employee_managment/models/employee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState>{
  final GetDataProvider getDataProvider;

  EmployeeBloc({required this.getDataProvider}):super(EmployeeInitState()){
    on<EmployeeEvent>(getEmployee);
    on<CreateEmployee>(createEmployee);
  }

  Future<void> getEmployee (EmployeeEvent event, Emitter<EmployeeState> emit)async{
    emit(EmployeeLoadingState());

    var response = await getDataProvider.getDataProvider('/employee');

    if(response.statusCode == 200){
      var data = List<EmployeeModel>.from(response.data.map((x) => EmployeeModel.fromJson(x)));

      emit(EmployeeLoadedState(data));
    }else{
      emit(EmployeeErrorState("errorMessage"));
    }
  }



  Future<void> createEmployee(CreateEmployee event, Emitter<EmployeeState> emit) async {
    emit(EmployeePostLoadingStata());

    try {
      var response = await getDataProvider.postData('/employee', event.employeeData);
      if (response.statusCode == 201) {
        emit(EmployeePostSuccessState());
      } else {
        emit(EmployeePostFailedState());
      }
    } catch (error) {
      emit(EmployeePostFailedState());
    }
  }
}