import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/percent_indicator.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(6, 4),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(6, 3),
];

List<Widget> _tiles = const <Widget>[
  // const Tile1(String target),
  // const Tile1(Colors.white, Icons.wifi),
  // const Tile2(Colors.white, Icons.panorama_wide_angle),
  // const Tile3(Colors.white, Icons.map),
  const Tile1(Colors.white, Icons.send),
  const _Example01Tile(
      Text("Breakfast"), AssetImage('assets/images/icon/1.png')),
  const _Example01Tile(Text("Lunch"), AssetImage('assets/images/icon/2.png')),
  const _Example01Tile(Text("Dinner"), AssetImage('assets/images/icon/3.png')),
  const _Example01Tile(Text("fefef"), AssetImage('assets/images/icon/1.png')),
];

class FoodPage extends StatefulWidget {
  @override
  FoodPageState createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
            ),
          ),
        ),
      ),
      body: Container(
          color: Colors.blueGrey,
          child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: new StaggeredGridView.count(
                crossAxisCount: 6,
                staggeredTiles: _staggeredTiles,
                children: _tiles,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                padding: const EdgeInsets.all(5.0),
              ))),
    );
  }
}

class Tile1 extends StatelessWidget {
  const Tile1(this.backgroundColor, this.icon);
  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.white,
      child: new InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => OrdinalSales()));
          },
          child: Container(
            margin: const EdgeInsets.all(20.0),
            constraints: BoxConstraints(minWidth: 100.0, minHeight: 150.0),
            child: Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[Text("cal Food")],
                ),
                Container(
                    alignment: Alignment.center,
                    constraints:
                        BoxConstraints(minWidth: 100.0, minHeight: 100.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text("1000",
                              style: TextStyle(fontSize: 50),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          child: Text("/1000 cal",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    )),
                Text("80.0%"),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 160,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 1000,
                        percent: 0.8,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.green,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.text, this.icon);

  final Text text;
  final AssetImage icon;

  @override
  Widget build(BuildContext context) {
    return new Card(
        color: Colors.white,
        child: new InkWell(
            onTap: () {},
            child: new Center(
              child: new Column(
                children: <Widget>[Image(image: icon, width: 80.0), text],
              ),
            )));
  }
}
