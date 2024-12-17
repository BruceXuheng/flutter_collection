import 'package:flutter/material.dart';
import 'package:flutter_collection/pages/home/tabs/FirstPushPage.dart';
import 'package:flutter_collection/pages/home/tabs/FollowPage.dart';
import 'package:flutter_collection/pages/home/tabs/HotspotPage.dart';
import 'package:flutter_collection/pages/home/tabs/OutGoPage.dart';
import 'package:flutter_collection/pages/home/tabs/PlayCardPage.dart';
import 'package:flutter_collection/pages/home/tabs/RecommendPage.dart';
import 'package:flutter_collection/pages/home/tabs/SportPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> _pages = <Widget>[
    FollowPage(),
    RecommendPage(),
    FirstPushPage(),
    PlayCardPage(),
    HotSpotPage(),
    SportPage(),
    OutGoPage()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _tabController.addListener(() {
      print("index== >" + _tabController.index.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Container(
      margin: EdgeInsets.fromLTRB(0, mediaQueryData.padding.top, 0, 0),
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.blue.withOpacity(0.5), // 设置背景色和透明度
            // ),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  onPressed: () {
                    print("签到成功");
                  },
                  icon: const Icon(
                    Icons.single_bed,
                    color: Color.fromARGB(255, 112, 112, 5),
                    size: 40,
                  ),
                ),
                HomeSearch(),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: 40,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                  labelStyle: TextStyle(fontSize: 18),
                  indicatorColor: const Color.fromARGB(255, 17, 16, 16), // 设置选中的底线颜色为蓝色
                  indicatorWeight: 2.0, // 可选：设置底线粗细
                  indicatorPadding: EdgeInsets.all(0.0), // 可选：设置底线与标签边缘的间距
                  
                  labelColor: const Color.fromARGB(255, 7, 6, 6),
                  unselectedLabelColor: Colors.black,
                  controller: _tabController,
                  
                  tabs: [
                    Tab(
                      child: Text("关注"),
                    ),
                    Tab(
                      child: Text("推荐"),
                    ),
                    Tab(
                      child: Text("新发"),
                    ),
                    Tab(
                      child: Text("玩机"),
                    ),
                    Tab(
                      child: Text("热点"),
                    ),
                    Tab(
                      child: Text("玩车"),
                    ),
                    Tab(
                      child: Text("运动"),
                    )
                  ])),
          Container(
            width: double.infinity,
            height: mediaQueryData.size.height-80-110,
            child: TabBarView(controller: _tabController, children: _pages),
          )

          // TEst()
        ],
      ),
    );
  }
}

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 80,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(color: Colors.black, width: 2)),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () {
                    print("扫一扫");
                  },
                  icon: Icon(Icons.qr_code_scanner))),
          const Expanded(
              flex: 12,
              child: TextField(
                // textAlignVertical: TextAlignVertical.center, // 设置文本垂直居中

                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: '小米15', // 默认提示字符
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // 无边框
                    ),
                    contentPadding: EdgeInsets.only(left: 20)),
              )),
          Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  padding: EdgeInsets.only(bottom: 0),
                ),
              ))
        ],
      ),
    );
  }
}
