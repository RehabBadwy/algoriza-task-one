import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task_one/registerScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool hidePassword = true;

  String email = '',
      password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 65),

                      Hero(
                        tag: 'logoAnimation',
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 10),
                child: Column(
                  children: <Widget>[
                    Text("Welcome to"),
                   Row(
                     children: [
                       Text("Sign In",
                         style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.bold
                         ),
                       ),
                       Spacer(),
                       Text('Help',
                       style: TextStyle(
                         color: Colors.blue
                       ),
                       )
                     ],
                   ),
                    SizedBox(height: 10),
                    Text("Phone Number",
                      style: TextStyle(

                      ),
                    ),
                    SizedBox(height: 15,),
                    Center(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                        border: Border.all()
                        ),
                        child: CountryCodePicker(
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'Eg',
                          favorite: ['+39','FR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: true,
                          enabled: true,
                          hideMainText: false,
                          showFlagMain: true,
                          showFlag: true,
                          hideSearch: false,
                          showFlagDialog: false,

                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Sign In',
                      ),
                      onPressed: () {
                        validationForm();
                      },
                    ),
                    Row(
                      children: [
                        Text('Dont have an Account',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                          },
                          child: Text('Sign Up',
                            style: TextStyle(
                                color: Colors.teal
                            ),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  validationForm() {
    if (_formKey.currentState?.validate() == true) {
      // loginRequestModel =  LoginRequestModel(email,password);
    }
  }
}