import 'package:flutter/material.dart';

class Player {
  String name;
  String color;
  int colorInt;
  int points;
  int cars;
  int trainCards;
  int destinationCards;
  bool active;

  Player(this.name, this.color, this.colorInt, this.points, this.cars, this.trainCards, this.destinationCards, this.active);
}

abstract class GamePlayerObserver {
  getPlayers();
}

class GamePlayerFragment extends StatefulWidget {
  GamePlayerFragment({Key key, this.title}) : super(key: key);

  final observers = List<GamePlayerObserver>();
  final String title;

  void addObserver(GamePlayerObserver o) {
    observers.add(o);
  }

  void removeObserver(GamePlayerObserver o) {
    observers.remove(o);
  }

  @override
  _GamePlayerFragmentState createState() => new _GamePlayerFragmentState();
}

class _GamePlayerFragmentState extends State<GamePlayerFragment> {

  var _players = [];

  @override
  initState() {
    super.initState();

    _getPlayers();
  }

  _getPlayers() async {
    for (var o in widget.observers) {
      await for(var response in o.getPlayers()) {
        var players = await response;
        setState(() {
          _players = players;
        });
      }
    }
  }

  _buildPlayers() {
    return _players.map((player) {
      return Container(
        decoration: new BoxDecoration(
          color: Colors.white,//Color(player.colorInt),
          border: new Border.all(
            color: player.active ? Colors.green : Colors.black,
            width: 5.0,
            style: BorderStyle.solid
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Padding(
          padding: Theme.of(context).platform == TargetPlatform.iOS ?
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0) :
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("images/player-${player.color}.jpg"),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                        alignment: FractionalOffset.centerLeft,
                      ),
                      Text(
                        player.name,
                        style: TextStyle(
                          fontSize: 10.0
                        ),
                      ),
                    ]
                  ),
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${player.points} points",
                    style: TextStyle(
                      fontSize: 10.0
                    ),
                  ),
                  Text(
                    "${player.cars} cars",
                    style: TextStyle(
                      fontSize: 10.0
                    ),
                  ),
                  Text(
                    "${player.trainCards} train cards",
                    style: TextStyle(
                      fontSize: 10.0
                    ),
                  ),
                  Text(
                    "${player.destinationCards} destination cards",
                    style: TextStyle(
                      fontSize: 10.0
                    ),
                  ),
                ]
              )
            ],
          )
        )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: List.from(_buildPlayers())
    );
  }
}
