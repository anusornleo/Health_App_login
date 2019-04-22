// import 'package:flutter/material.dart';
// import './SignUp.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import './Home.dart';
// import 'package:flutter/scheduler.dart';

// //ANCHOR This Start of Signin class

// class SignIn extends StatefulWidget{

//   //call sign in state
//   @override
//   SignInState createState() => new SignInState();

// }

// class SignInState extends State<SignIn>{

//   String _email, _password;
//   final _formKey = GlobalKey<FormState>();

//   //NOTE Start SignIn Interface
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       //body part
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   validator: (input){
//                     if(input.isEmpty){
//                       return 'Please fill the form';
//                     }
//                   },
//                   onSaved: (input) => _email = input,
//                   decoration: InputDecoration(
//                     labelText: 'Email'
//                   ),
//                 ),

//                 //SECTION password
//                 TextFormField(
//                   validator: (input){
//                     if(input.isEmpty){
//                       return 'Please fill the password';
//                     }else if(input.length < 6){
//                       return 'Your password is less than 6 letter';
//                     }
//                   },
//                   onSaved: (input) => _password = input,
//                   decoration: InputDecoration(
//                     labelText: 'Password'
//                   ),
//                   obscureText: true,
//                 ),
//                 new Container(
//                   margin: const EdgeInsets.only(top:10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       RaisedButton(
//                         onPressed: (){
//                           signInFlutter();
//                         },
//                       child: Text('Sign In'),
//                       ),
//                       RaisedButton(
//                         onPressed: (){
//                           signUpFlutter();
//                         },
//                       child: Text('Sign Up'),
//                       )
//                     ],
//                   )
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   //NOTE connected to flutter
//   Future<void> signInFlutter() async {
//     final formState = _formKey.currentState;
//     if(formState.validate()){
//       formState.save();
//       debugPrint(_email);
//       debugPrint(_password);
//       try{
//         FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
//         //Firestore.instance.collection('users').document(user.uid).setData({ 'Age': '20', 'job': 'student', 'name': 'benning'});
//         _navigateToHome(user);
//       }catch(e){
//         print(e.message);
//       }

//     }
//   }

//   //NOTE sign up page
//   void signUpFlutter(){
//       _navigateToSignUp();
//   }

//   void _navigateToSignUp() async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignUp()),
//     );
//   }

//   void _navigateToHome(FirebaseUser user) async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => Home(user: user)),
//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_app/ui/ButtonGradient.dart';
import 'package:health_app/ui/Home.dart';
import 'package:health_app/ui/SignUp1.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
  void initState() {
    super.initState();
    getUser().then((user) {
      setState(() {
        loading = true;
      });
      if (user != null) {
        if (user.isEmailVerified) {
          setState(() {
            loading = false;
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home(user: user)));
        } else {
          setState(() {
            loading = false;
          });
          print("Please check your email to verified account");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      } else {
        setState(() {
          loading = false;
        });
      }
    });
  }

  Future<FirebaseUser> getUser() async {
    return await auth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    child: Image.asset("assets/img/2.png"),
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) return "Email is required";
                    },
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) return "Password is required";
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 50),
                    child: FlatGradientButton(
                        width: 100,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xFF3366FF), Color(0xFF00CCFF)],
                        ),
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          auth
                              .signInWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          )
                              .then((FirebaseUser user) {
                            if (user.isEmailVerified) {
                              print("go to home screen");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home(user: user)));
                            } else {
                              print(
                                  "Please check your email to verified account");
                              setState(() {
                                loading = false;
                              });
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title:
                                            Text("Please verified your Email"),
                                        content: Text(
                                            "Go to your email inbox and find latest 'noreply' and Click link from it"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Ok"),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          )
                                        ],
                                      ));
                            }
                          }).catchError((error) {
                            print("$error");
                            setState(() {
                              loading = false;
                            });
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("Error"),
                                      content:
                                          Text("Email or Password not Correct"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ok"),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        )
                                      ],
                                    ));
                          });
                        }),
                  ),
                  FlatButton(
                    child: Text("Register new user"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisFirst()));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        _showCircularProgress(),
      ],
    ));
  }
}
