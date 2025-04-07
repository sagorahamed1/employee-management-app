import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/emplyee/employee_bloc.dart';
import '../../../bloc/emplyee/employee_event.dart';
import '../../../core/routes/app_routes.dart';

class UpdateEmployeeScreen extends StatelessWidget {
   final String id;
   UpdateEmployeeScreen({super.key, required this.id});

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController designCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  TextEditingController idCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                    hintText: "Enter your name"
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: designCtrl,
                decoration: const InputDecoration(
                    hintText: "Enter your Designation"
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: ageCtrl,
                decoration: const InputDecoration(
                    hintText: "Enter your age"
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: idCtrl,
                decoration: const InputDecoration(
                    hintText: "Enter Id"
                ),
              ),
            ),

            const SizedBox(height: 100),


            ///==============log in button============>>>
            GestureDetector(
              onTap: (){

                var body =    {
                  "createdAt": "createdAt 2",
                  "name": "${nameCtrl.text}",
                  "avatar": "avatar 2",
                  "designation": "${designCtrl.text}",
                  "age": "${ageCtrl.text}",
                  "id": "$id"
                };

                context.pop();

                if(nameCtrl.text == null){

                }else{
                  nameCtrl.clear();
                  context.read<EmployeeBloc>().add(UpdateEmployeeEvent(body, id: id));
                }


              },
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.purpleAccent,
                    border: Border.all(color: Colors.purpleAccent, width: 1.5)
                ),
                child: const Center(child: Text("Update Employee")),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
