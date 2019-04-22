import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'staticPage/AboutPage.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
//  var client = new http.Client();
//  client.get("https://feeds.jjldbk.com/all.xml").then((response) {
//    return response.body;
//  }).then((bodyString) {
//    var channel = new RssFeed.parse(bodyString);
//    print(channel.items[0].enclosure.url);
//    return channel;
//  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '津津乐道播客',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
      routes: {
        "/list": (BuildContext context) => ListPage(),
        '/about': (BuildContext context) => AboutPage(),
        '/player': (BuildContext context) => PlayerPage()
      },
      initialRoute: '/list',
    );
  }
}

class ListPage extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: "津津乐道"),
    Tab(text: "乱槽之巅"),
    Tab(text: "李大夫夜话")
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "津津乐道播客",
      home: DefaultTabController(
          length: myTabs.length,
          child: new Scaffold(
            appBar: AppBar(
              title: Text("津津乐道播客"),
              bottom: TabBar(tabs: myTabs),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.info),
                  tooltip: "关于",
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new AboutPage()));
                  },
                )
              ],
            ),
            body: TabBarView(
                children: myTabs.map((Tab tab) {
                  return Center(
                      child: new Card(
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              new ListTile(
                                title: new Text("vol.146 生活这么苦，为什么你们还要玩更苦的游戏"),
                                subtitle: new Text(
                                    "近年来，一家名为 From Software 的日本游戏公司得到了玩家们的盛赞，他们开发的一系列游戏（被称为“魂”系游戏）以极高的难度收获了一些固定的硬核玩家。继他们的大热作品《血源诅咒》、《黑暗之魂3》后，最近他们发售的新作《只狼：影逝二度》再次引起了一波新的文化现象"),
                                leading: new Icon(
                                  Icons.music_note,
                                  color: Colors.lightBlue,
                                ),
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(
                                      builder: (context) => PlayerPage()));
                                },
                              ),
                            ],
                          )));
                }).toList()),
          )),
    );
  }
}

Column buildButtonColum(IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(icon, color: Colors.blue[900]),
      Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue[900]
            )
          ),
      )
    ],
  );
}

Widget buttonsContainer = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      buildButtonColum(Icons.play_arrow, "播放"),
      buildButtonColum(Icons.stop, "停止播放"),
    ],
  ),
);


class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = new AudioPlayer();
    audioPlayer.play("https://cast.jjldbk.com/series/0146.mp3");
    return Scaffold(
        appBar: AppBar(
          title: Text('播放器'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset("images/logo.png"),
            new Divider(),
            new Text(
                """近年来，一家名为 From Software 的日本游戏公司得到了玩家们的盛赞，他们开发的一系列游戏（被称为“魂”系游戏）以极高的难度收获了一些固定的硬核玩家。继他们的大热作品《血源诅咒》、《黑暗之魂3》后，最近他们发售的新作《只狼：影逝二度》再次引起了一波新的文化现象r"""),
            new Divider(),
            buttonsContainer,
          ],
        ));
  }
}
