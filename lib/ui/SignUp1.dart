import 'package:flutter/material.dart';
import 'package:health_app/ui/SignUp2.dart';

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
          color: Colors.amber,
          child: Padding(
              padding: EdgeInsets.only(top: 0, left: 18, right: 18, bottom: 0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "data",
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
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value.isEmpty) return "Email is required";
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value.isEmpty) return "Password is required";
                      },
                    ),
                    TextFormField(
                      controller: rePasswordController,
                      decoration: InputDecoration(labelText: 'Password Again'),
                      validator: (value) {
                        if (value.isEmpty) return "Password is required";
                      },
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blue,
                          child: Text("Cancle"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          color: Colors.blue,
                          child: Text("Next"),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              dataRegis['username'] = usernameController.text;
                              dataRegis['email'] = emailController.text;
                              dataRegis['password'] = passwordController.text;
                              print(dataRegis);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisSecond()));
                            }
                          },
                        )
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
