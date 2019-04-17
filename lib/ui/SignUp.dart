import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app/ui/SignIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

// class SignUp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => SignUpState();
// }

// class SignUpState extends State<SignUp> {
//   String _email, _password;
//   double _weight, _height;
//   final _formKey = GlobalKey<FormState>();

//   FirebaseUser user;
//   FocusNode myFocusNode;

//   String _datetime = '';
//   int _year = 2018;
//   int _month = 11;
//   int _date = 11;

//   String _lang = 'i18n';
//   String _format = 'yyyy-mm-dd';
//   bool _showTitleActions = true;

//   TextEditingController _langCtrl = TextEditingController();
//   TextEditingController _formatCtrl = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _langCtrl.text = 'i18n';
//     _formatCtrl.text = 'yyyy-mm-dd';

//     DateTime now = DateTime.now();
//     _year = now.year;
//     _month = now.month;
//     _date = now.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     var blue = Colors.blue;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   validator: (input) {
//                     if (input.isEmpty) {
//                       return 'Please fill the form';
//                     }
//                   },
//                   onSaved: (input) => _email = input,
//                   decoration: InputDecoration(labelText: 'Email'),
//                 ),

//                 //SECTION password
//                 TextFormField(
//                   validator: (input) {
//                     if (input.isEmpty) {
//                       return 'Please fill the password';
//                     } else if (input.length < 6) {
//                       return 'Your password is less than 6 letter';
//                     }
//                   },
//                   onSaved: (input) => _password = input,
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                 ),
//                 TextFormField(
//                     inputFormatters: [
//                       WhitelistingTextInputFormatter.digitsOnly
//                     ],
//                     validator: (input) {
//                       if (input.isEmpty) {
//                         return 'Please fill your current weight';
//                       }
//                     },
//                     decoration: InputDecoration(labelText: 'Weight')),
//                 TextFormField(
//                     inputFormatters: [
//                       WhitelistingTextInputFormatter.digitsOnly
//                     ],
//                     validator: (input) {
//                       if (input.isEmpty) {
//                         return 'Please fill your current weight';
//                       }
//                     },
//                     decoration: InputDecoration(labelText: 'Height')),
//                 TextFormField(
//                   focusNode: myFocusNode,
//                   decoration: InputDecoration(labelText: 'Date Of Birth'),
//                 ),

//                 new Container(
//                   margin: const EdgeInsets.only(top: 10.0),
//                   child: Column(
//                     children: <Widget>[
//                       RaisedButton(
//                         onPressed: () {
//                           signUpFlutter();
//                         },
//                         child: Text('Sign Up'),
//                       ),
//                       RaisedButton(
//                         onPressed: () {
//                           _showDatePicker();
//                         },
//                         child: Text('date'),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> signUpFlutter() async {
//     final formState = _formKey.currentState;
//     if (formState.validate()) {
//       formState.save();
//       debugPrint(_email);
//       debugPrint(_password);
//       try {
//         this.user = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: _email, password: _password);
//         _addData();
//       } catch (e) {
//         print(e.message);
//       }
//     }
//   }

//   void _navigateToSignIn() async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignIn()),
//     );
//   }

//   void _addData() {
//     Firestore.instance.runTransaction((Transaction transaction) async {
//       DocumentReference reference =
//           Firestore.instance.collection('users').document('${user.uid}');
//       await reference.setData({"name": 'benning', "age": 20, "job": 'student'});
//     });
//     Navigator.of(context).pop();
//   }

//   void _showDatePicker() {
//     final bool showTitleActions = false;
//     DatePicker.showDatePicker(
//       context,
//       showTitleActions: _showTitleActions,
//       minYear: 1970,
//       maxYear: 2020,
//       initialYear: _year,
//       initialMonth: _month,
//       initialDate: _date,
//       confirm: Text(
//         'custom ok',
//         style: TextStyle(color: Colors.red),
//       ),
//       cancel: Text(
//         'custom cancel',
//         style: TextStyle(color: Colors.cyan),
//       ),
//       locale: _lang,
//       dateFormat: _format,
//       onChanged: (year, month, date) {
//         debugPrint('onChanged date: $year-$month-$date');

//         if (!showTitleActions) {
//           _changeDatetime(year, month, date);
//         }
//       },
//       onConfirm: (year, month, date) {
//         _changeDatetime(year, month, date);
//       },
//     );
//   }

//   void _changeDatetime(int year, int month, int date) {
//     setState(() {
//       _year = year;
//       _month = month;
//       _date = date;
//       _datetime = '$year-$month-$date';
//     });
//   }
// }
import 'package:progress_indicators/progress_indicators.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseUser user;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  bool loading = false;

  Widget _showCircularProgress() {
    if (loading) {
      return Container(
          color: Color.fromARGB(200, 255, 255, 255),
          child: Center(
            child: JumpingDotsProgressIndicator(
              fontSize: 80.0,
              milliseconds: 100,
              color: Colors.blueAccent,
              numberOfDots: 4,
              dotSpacing: 2,
            ),
          ));
    }
    return Container(
      width: 0,
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register new user"),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(18),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) return "Email is required";
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty && value.length < 8)
                          return "Password is required";
                      },
                    ),
                    TextFormField(
                      controller: rePasswordController,
                      decoration: InputDecoration(labelText: "Re Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) return "Password is required";
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            child: Text("Register"),
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                auth
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((FirebaseUser user) {
                                  Firestore.instance.runTransaction(
                                      (Transaction transaction) async {
                                    DocumentReference reference = Firestore
                                        .instance
                                        .collection('users')
                                        .document('${user.uid}');
                                    await reference.setData({
                                      "name": emailController.text,
                                      "age": 20,
                                      "job": 'god'
                                    });
                                  });
                                  user.sendEmailVerification().then((user) {
                                    setState(() {
                                      loading = false;
                                    });
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Text("OK"),
                                              content: Text("Check you Email"),
                                              actions: <Widget>[
                                                FlatButton(
                                                    child: Text("Ok"),
                                                    onPressed: () => Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LoginScreen())))
                                              ],
                                            ));
                                  });
                                  print("return from firebase ${user.email}");
                                }).catchError((error) {
                                  print("$error");
                                });
                              } else {
                                print("error");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _showCircularProgress(),
          ],
        ));
  }

  // void _addData() {
  //   Firestore.instance.runTransaction((Transaction transaction) async {
  //     DocumentReference reference =
  //         Firestore.instance.collection('users').document('${user.uid}');
  //     await reference.setData({"name": 'benning', "age": 20, "job": 'student'});
  //   });
  // }
}
