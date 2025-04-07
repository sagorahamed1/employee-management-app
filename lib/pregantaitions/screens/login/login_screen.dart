import 'package:employee_managment/bloc/emplyee/employee_bloc.dart';
import 'package:employee_managment/bloc/emplyee/employee_event.dart';
import 'package:employee_managment/core/routes/app_routes.dart';
import 'package:employee_managment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController designCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const  SizedBox(height: 100),
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
                  "id": "1"
                };



                if(nameCtrl.text == null){

                }else{
                  context.read<EmployeeBloc>().add(CreateEmployee(body));
                  nameCtrl.clear();
                  ageCtrl.clear();
                  designCtrl.clear();

                  context.pop();

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
                child: const Center(child: Text("Log In")),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
