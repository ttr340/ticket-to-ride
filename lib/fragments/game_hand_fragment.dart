import 'package:flutter/material.dart';

// class Player {
//   String name;
//   String color;
//
//   Player(this.name, this.color);
// }
//
// class LobbyGame {
//   String name;
//   String hostName;
//   List players = [];
//   bool canStart = false;
// }

abstract class GameHandObserver {
  claimRoute() {}
}

class GameHandFragment extends StatefulWidget {
  GameHandFragment(this.navKey, {Key key, this.title}) : super(key: key);

  final GlobalKey<NavigatorState> navKey;
  final observers = List<GameHandObserver>();
  final String title;

  void addObserver(GameHandObserver o) {
    observers.add(o);
  }

  void removeObserver(GameHandObserver o) {
    observers.remove(o);
  }

  void navigatePush(String routeName) {
    navKey.currentState.pushNamed(routeName);
  }

  void navigatePop() {
    navKey.currentState.pop();
  }

  @override
  _GameHandFragmentState createState() => new _GameHandFragmentState();
}

class _GameHandFragmentState extends State<GameHandFragment> {

  _buildCities() {
    double width = MediaQuery.of(context).size.width * .75;
    double height = MediaQuery.of(context).size.height * .70;

    var cities = [[.10, .3], [.5, .5], [.75, .05]];

    return cities.map((point) {
      return Positioned(
        left: width * point[0],
        top: height * point[1],
        child: Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: const Color(0xff000000),
            borderRadius: new BorderRadius.circular(25.0),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .75;
    double height = MediaQuery.of(context).size.height * .70;

    return new Stack(
        children: List.from([
          Container(
            width: width,
            height: height,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/map.png"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ])..addAll(_buildCities())
    );
  }
}
