import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task_one/login.dart';


class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  bool hidePassword = true;

  String email = '',
      password = '',
      userName = '';


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
                        Text("Register",
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
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(

                        labelText: 'Enter your email',
                        hintText: 'ex: test@gmail.com',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(

                          )
                        )
                      ),
                      onChanged: (text) {
                        email = text;
                      },
                      validator: (value) =>
                      value!.isEmpty
                          ? 'You must enter a valid email'
                          : null,
                    ),
                    SizedBox(height: 10),
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
                    TextFormField(
                      keyboardType: TextInputType.text,

                      decoration: InputDecoration(
                       border: OutlineInputBorder(
                              borderSide: BorderSide(

                              )
                          ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: Colors.blue,
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        labelText: 'Enter your password',
                      ),
                      obscureText: hidePassword,
                      onChanged: (text) {
                        password = text;
                      },
                      validator: (value) =>
                      value!.length <= 6
                          ? 'Your password must be larger than 6 characters'
                          : null,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text(
                        'Register',
                      ),
                      onPressed: () {
                        validationForm();
                      },
                    ),
                    Row(
                      children: [
                        Text('Has Any Account',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                          },
                          child: Text('Sign In',
                            style: TextStyle(
                                color: Colors.teal
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 6),
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
      // APIService.Register(email, password, userName, myUser);

    }
  }
}