import 'package:flutter/material.dart';
import 'package:flutter_collection/pages/detail/ProudctDetailPage.dart';

class FollowPage extends StatelessWidget {
  const FollowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("基本路由 跳转详情页"),
          onTap: (){
              Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context)=> ProudctDetailPage(title: "adasdsa阿萨德"))
            );
          },
        ), ListTile(
          title: Text("命名路由 跳转详情页"),
          onTap: (){
             Navigator.pushNamed(context, "/detail", arguments:{"title":"命令路由跳转来的"} );
          },
        ) , ListTile(
          title: Text("命名路由 带参数 跳转详情页"),
          onTap: (){
            // 替换路由
            // Navigator.pushReplacementNamed(context, routeName)
            // 返回根路由
            // Navigator.pushAndRemoveUntil(context, newRoute, predicate)
             Navigator.pushNamed(context, "/form", arguments:{"title":"命令路由 带参数 跳转来的"} );
          },
        ) 
      ],
    );
  }
}
