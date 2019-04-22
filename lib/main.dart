import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app/Boloc/counter_event.dart';
import 'package:health_app/model/add_data_firebase.dart';
import 'package:health_app/ui/FoodUI.dart';
import 'package:health_app/ui/Home.dart';
import 'package:health_app/ui/SignUp.dart';
import 'package:health_app/ui/map_screen.dart';
import './ui/SignIn.dart';
import './Boloc/counterBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carolies-Count-App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'SF-Pro-Text8'),
      debugShowCheckedModeBanner: false,
      home: new LoginScreen(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return Mystate();
//   }
// }

// class Mystate extends State<MyApp> {
//   final CounterBloc _counterBloc = CounterBloc();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "ok",
//         home: BlocProvider<CounterBloc>(
//           bloc: _counterBloc,
//           child: LoginScreen(),
//         ));
//   }
// }

// class CounterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CounterBloc _counterBlog = BlocProvider.of<CounterBloc>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text("counter"), actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.remove),
//           onPressed: () {
//             _counterBlog.dispatch(CounterEvent.decrement);
//           },
//         )
//       ]),
//       body: BlocBuilder<CounterEvent, int>(
//         bloc: _counterBlog,
//         builder: (BuildContext context, int count) {
//           return Center(
//             child: Text(
//               '$count',
//               style: TextStyle(fontSize: 24.0),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: () {
//                 _counterBlog.dispatch(CounterEvent.increment);
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
