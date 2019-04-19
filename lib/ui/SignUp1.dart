import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_app/ui/ButtonGradient.dart';
import 'package:health_app/ui/SignUp2.dart';
import 'package:health_app/ui/alert_ok.dart';

class RegisFirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisFirstState();
  }
}

class RegisFirstState extends State<RegisFirst> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  var dataRegis = new Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
              padding: EdgeInsets.only(top: 0, left: 18, right: 18, bottom: 0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Create Your Account",
                      style: TextStyle(fontSize: 30),
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value.isEmpty) return "Username is required";
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value.isEmpty) return "Email is required";
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value.isEmpty) return "Password is required";
                      },
                    ),
                    TextFormField(
                      controller: rePasswordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password Again'),
                      validator: (value) {
                        if (value.isEmpty) return "Password is required";
                      },
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatGradientButton(
                            width: 100,
                            child: Text(
                              'Cancle',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF3366FF),
                                Color(0xFF00CCFF)
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        FlatGradientButton(
                            width: 100,
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF3366FF),
                                Color(0xFF00CCFF)
                              ],
                            ),
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailController.text)) {
                                  alert_box(
                                      "Email Format Incollect",
                                      "Please check you Email again and Input collect Format",
                                      context);
                                } else if (passwordController.text.length < 8 ||
                                    rePasswordController.text.length < 8) {
                                  alert_box(
                                      "The Password must have more than 8 characters",
                                      "Please check you Password both TextField again",
                                      context);
                                } else if (passwordController.text !=
                                    rePasswordController.text) {
                                  alert_box(
                                      "The password is not the same.",
                                      "Please check you password in TextField again",
                                      context);
                                } else {
                                  dataRegis['username'] =
                                      usernameController.text;
                                  dataRegis['email'] = emailController.text;
                                  dataRegis['password'] =
                                      passwordController.text;
                                  print(dataRegis);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisSecond(dataRegis)));
                                }
                              }
                            }),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    ));
  }
}
