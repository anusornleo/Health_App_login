import 'package:flutter/material.dart';
import 'package:health_app/ui/ButtonGradient.dart';
import 'package:health_app/ui/SignUp.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:health_app/ui/alert_ok.dart';

class RegisSecond extends StatefulWidget {
  Map dataRegis = new Map();
  RegisSecond(this.dataRegis);

  @override
  State<StatefulWidget> createState() {
    return RegisSecondState(dataRegis);
  }
}

class RegisSecondState extends State<RegisSecond> {
  final _formkey = GlobalKey<FormState>();
  Map dataRegis = new Map();

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController txt = new TextEditingController();

  RegisSecondState(this.dataRegis);

  String _gen = "";
  String _datetime = '';
  int _year;
  int _month;
  int _date;

  String _lang = 'i18n';
  String _format = 'yyyy-mm-dd';

  String dob = "";
  int age;

  bool _showTitleActions = true;
  void _handleRadioValueChange1(String value) {
    setState(() {
      _gen = value;
      print(_gen);
    });
  }

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: _showTitleActions,
      minYear: 1950,
      maxYear: 2020,
      initialYear: _year,
      initialMonth: _month,
      initialDate: _date,
      confirm: Text(
        'Select',
        style: TextStyle(color: Colors.red),
      ),
      cancel: Text(
        'Cancel',
        style: TextStyle(color: Colors.cyan),
      ),
      locale: _lang,
      dateFormat: _format,
      onChanged: (year, month, date) {},
      onConfirm: (year, month, date) {
        _date = date;
        _year = year;
        _month = month;
        if (_month < 10) {
          if (_date < 10) {
            dob = "$_year-0$_month-0$_date";
          } else {
            dob = "$_year-0$_month-$_date";
          }
        } else {
          if (_date < 10) {
            dob = "$_year-$_month-0$_date";
          } else {
            dob = "$_year-$_month-$_date";
          }
        }

        print(dob);
        txt.text = _date.toString() +
            " - " +
            _month.toString() +
            " - " +
            _year.toString();
        age = ((DateTime.now().difference(DateTime.parse(dob)).inDays) / 365)
            .round();
      },
    );
  }

  // void alert_box(String title, String content) {
  //   showDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //             title: Text(title),
  //             content: Text(content),
  //             actions: <Widget>[
  //               FlatButton(
  //                   child: Text("Ok"), onPressed: () => Navigator.pop(context))
  //             ],
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formkey,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 0, left: 18, right: 18, bottom: 0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Input your Information",
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Radio(
                                  value: 'Male',
                                  groupValue: _gen,
                                  onChanged: _handleRadioValueChange1,
                                ),
                                new Text(
                                  'Male',
                                  style: new TextStyle(fontSize: 16.0),
                                ),
                                new Radio(
                                  value: 'Female',
                                  groupValue: _gen,
                                  onChanged: _handleRadioValueChange1,
                                ),
                                new Text(
                                  'Female',
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ])),
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40, bottom: 30),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: TextFormField(
                            controller: txt,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.date_range),
                                    onPressed: () {
                                      setState(() {
                                        _showDatePicker();
                                        txt.text = "";
                                        print(txt);
                                      });
                                    }),
                                labelText: "Date Of Birth"),
                          ),
                        ),
                        Container(
                            child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: heightController,
                                      decoration:
                                          InputDecoration(labelText: 'Height'),
                                      validator: (value) {
                                        if (value.isEmpty) return "Height";
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: weightController,
                                      decoration:
                                          InputDecoration(labelText: 'Weight'),
                                      validator: (value) {
                                        if (value.isEmpty) return "Weight";
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ])),
                      ],
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatGradientButton(
                          width: 100,
                          child: Text(
                            'Previous',
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
                              if (_gen.length == 0) {
                                alert_box("You have not selected Gender",
                                    "Please selected your Gender", context);
                              } else if (dob.length == 0) {
                                alert_box("You have not selected your Birthday",
                                    "Please selected your Birthday", context);
                              } else if (double.parse(weightController.text) <
                                      10 ||
                                  double.parse(weightController.text) > 300) {
                                alert_box(
                                    "Weight is not Collect",
                                    "Try again to input your weight again",
                                    context);
                              } else if (double.parse(heightController.text) <
                                      50 ||
                                  double.parse(heightController.text) > 300) {
                                alert_box(
                                    "Height is not Collect",
                                    "Try again to input your Height again",
                                    context);
                              } else {
                                dataRegis['dob'] = dob;
                                dataRegis['age'] = age;
                                dataRegis['gen'] = _gen;
                                dataRegis['height'] = heightController.text;
                                dataRegis['weight'] = weightController.text;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen(dataRegis)));
                              }
                            }
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

// import 'package:flutter/material.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int _radioValue1 = 0;

//   void _handleRadioValueChange1(int value) {
//     setState(() {
//       _radioValue1 = value;
//       switch (_radioValue1) {
//         case 0:
//           print(1);
//           break;
//         case 1:
//           print(2);
//           break;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         home: new Scaffold(
//             appBar: AppBar(
//               title: new Text('Kids Quiz App'),
//               centerTitle: true,
//               backgroundColor: Colors.blue,
//             ),
//             body: new Container(
//                 padding: EdgeInsets.all(8.0),
//                 child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       new Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           new Radio(
//                             value: 0,
//                             groupValue: _radioValue1,
//                             onChanged: _handleRadioValueChange1,
//                           ),
//                           new Text(
//                             'Carnivore',
//                             style: new TextStyle(fontSize: 16.0),
//                           ),
//                           new Radio(
//                             value: 1,
//                             groupValue: _radioValue1,
//                             onChanged: _handleRadioValueChange1,
//                           ),
//                           new Text(
//                             'Herbivore',
//                             style: new TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ]))));
//   }

// void validateAnswers() {
//   if (_radioValue1 == -1 && _radioValue2 == -1 &&
//       _radioValue3 == -1 && _radioValue4 == -1 &&
//       _radioValue5 == -1) {
//     Fluttertoast.showToast(msg: 'Please select atleast one answer',
//         toastLength: Toast.LENGTH_SHORT);
//   } else {
//     Fluttertoast.showToast(
//         msg: 'Your total score is: $correctScore out of 5',
//         toastLength: Toast.LENGTH_LONG);
//   }
// }
