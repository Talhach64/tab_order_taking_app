import 'package:flutter/material.dart';
import 'package:tab_order_taking/pages/home.dart';
import '../components/pass_form_widget.dart';
import '../components/text_form_widget.dart';
import '../main.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // UserModel? user;
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    // print("init called");

    super.initState();
  }
  @override
  void dispose() {

    // print("Disposed");
    emailController.dispose();
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: autoValidateMode,
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      // const Img(),
                      const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 35,color: primaryColor),
                      ),
                      const SizedBox(height: 10.0),
                      MyTextFormField(
                          label: 'Email',
                          hint: 'Email',
                          controller: emailController,
                          validator: (String? value) =>
                              value!.isEmpty ? "Invalid Email or Password" : null),
                      MyPassField(
                        label: 'Password',
                        hint: 'Password',
                        controller: passwordController,
                        validator: (String? value) =>
                        value!.isEmpty ? "Invalid Email or Password" : null ,
                        keyboard: TextInputType.text,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return LoadingIcon(label: "Logging In...");
                            //     });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  const Home()));
                          } else {
                            setState(() {});
                          }
                          // Navigator.of(context).push(
                          //           MaterialPageRoute(
                          //               builder: (context) =>  Home()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          fixedSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'SIGN IN',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      MyTextFormField(
                          label: 'ID',
                          hint: 'ID',
                          controller: idController,
                          validator: (String? value) =>
                          value!.isEmpty ? "Invalid Email or Password" : null),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: ()  {
                              // if (_formKey.currentState!.validate()) {
                              //   showDialog(
                              //       context: context,
                              //       builder: (context) {
                              //         return LoadingIcon(label: "Logging In...");
                              //       });
                              // } else {
                              //   setState(() {});
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Load ID',
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: ()  {
                              // if (_formKey.currentState!.validate()) {
                              //   showDialog(
                              //       context: context,
                              //       builder: (context) {
                              //         return LoadingIcon(label: "Logging In...");
                              //       });
                              // } else {
                              //   setState(() {});
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Save ID',
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  }
}
