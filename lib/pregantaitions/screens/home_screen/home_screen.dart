import 'package:employee_managment/bloc/emplyee/employee_bloc.dart';
import 'package:employee_managment/bloc/emplyee/employee_event.dart';
import 'package:employee_managment/bloc/emplyee/employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EmployeeBloc>().add(GetEmployee());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Management'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            context.push(AppRoutes.updateEmployeeScreen);
          }, icon: const Icon(Icons.edit))
        ],
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoadingState) {
            // Show loading spinner while fetching data
            return const Center(child: CircularProgressIndicator());
          } else if (state is EmployeeErrorState) {
            // Show error message in case of failure
            return const Center(child: Text("Failed to load employees. Please try again."));
          } else if (state is EmployeeLoadedState) {
            // Show employee list when data is loaded
            if (state.employee == null || state.employee!.isEmpty) {
              return const Center(child: Text("No employees available."));
            }

            return ListView.separated(
              itemCount: state.employee!.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                var employee = state.employee![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                        employee.name?.length == 0 ? "0" : (employee.name?[0]).toString()
                        )
                  ),
                  title: Text(employee.name.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(employee.designation.toString()),
                  onTap: () {
                    // Implement navigation or actions on tap
                  },
                );
              },
            );
          }

          // Return empty space when no matching state is found
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
