import 'package:employee_managment/bloc/emplyee/employee_event.dart';
import 'package:employee_managment/bloc/emplyee/employee_state.dart';
import 'package:employee_managment/helpers/dio_data_provider.dart';
import 'package:employee_managment/models/employee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState>{
  final DioDataProvider getDataProvider;

  EmployeeBloc({required this.getDataProvider}):super(EmployeeInitState()){
    on<EmployeeEvent>(getEmployee);
    on<CreateEmployee>(createEmployee);
    on<DeleteEmployeeEvent>(deleteEmployee);
    on<UpdateEmployeeEvent>(updateEmployee as EventHandler<UpdateEmployeeEvent, EmployeeState>);
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
      var response = await getDataProvider.postData('/employee', event.employeeData);
      if (response.statusCode == 200) {
        emit(EmployeePostSuccessState());
      } else {
        emit(EmployeePostFailedState());
      }
  }


  Future<void> updateEmployee (UpdateEmployeeEvent event, Emitter<EmployeeState> emit)async{
    emit(UpdateEmployeeLoadingState());

    var response = await getDataProvider.putData("/employee/${event.id}", event.employeeUpdateDate);
    if (response.statusCode == 201 || response.statusCode == 200) {
      emit(EmployeePostSuccessState());
    } else {
      emit(EmployeePostFailedState());
    }
  }


  Future<void> deleteEmployee(DeleteEmployeeEvent event, Emitter<EmployeeState> emit)async{
    var response = await getDataProvider.deleteData("/employee/${event.id}");

    if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204){
      emit(DeleteEmployeeSuccessState());
    }else{
      emit(DeleteEmployeeFailState());
    }
  }
}