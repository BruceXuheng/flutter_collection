import 'package:flutter/material.dart';
import 'package:flutter_collection/pages/activity/ActivityPage.dart';
import 'package:flutter_collection/pages/detail/ProudctDetailPage.dart';
import 'package:flutter_collection/pages/detail/ProudctDetailPageFrom.dart';
import 'package:flutter_collection/pages/home/HomePage.dart';
import 'package:flutter_collection/pages/location/LocationPage.dart';
import 'package:flutter_collection/pages/message/MessagePage.dart';
import 'package:flutter_collection/pages/my/MyPage.dart';

void main() {
  Map routes = {
    // "/": (context) => const RootApp(),
    // "/home":(context) => const HomeSearch(),
    "/detail": (context) => const ProudctDetailPage(title: ""),
    "/form": (context,{arguments}) =>   ProudctDetailPageFrom(arguments:arguments),
  };
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: RootApp(),
    routes: {
      // "/": (context) => const RootApp(),
      // "/home":(context) => const HomeSearch(),
      "/detail": (context) => const ProudctDetailPage(title: ""),
    },
    onGenerateRoute: (RouteSettings settings) {
      final String? name = settings.name;
      final Function? pageContentBuilder = routes[name];

      if(pageContentBuilder != null){
          if(settings.arguments != null){

           return  MaterialPageRoute(builder: (context)=>pageContentBuilder(context,arguments:settings.arguments));

          }else{
           return  MaterialPageRoute(builder: (context)=>pageContentBuilder(context));
          }
      }
      return null;
    },
  ));
}

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with SingleTickerProviderStateMixin {
  final List<Widget> _myPage = <Widget>[
    const Homepage(),
    const LocationPage(),
    const ActivityPage(),
    const MessagePage(),
    const MyPage()
  ];

  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          selectedItemColor: const Color.fromARGB(255, 58, 40, 149),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "闲鱼"),
            BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "北京"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.paypal,
                ),
                label: "卖闲置"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
            BottomNavigationBarItem(
                icon: Icon(Icons.self_improvement), label: "我的")
          ]),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 58, 40, 149),
            borderRadius: BorderRadius.circular(80)),
        child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 58, 40, 149),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
