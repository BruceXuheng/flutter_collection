import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  void _alertDailog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("您的内容"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop("ok");
                    print("确定");
                  },
                  child: const Text("确定")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop("取消");
                    print("取消");
                  },
                  child: const Text("取消")),
            ],
          );
        });
    print("++++++++++++++++");
    print(result);
    print("++++++++++++++++");
    if (result != null) {
      // 处理结果
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("你输入的内容是: $result")),
      );
    }
  }

  void _simpleDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("选择语言:"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });
  }

  Future<void> showListDialog() async {
    int? index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          ElevatedButton(onPressed: _alertDailog, child: Text("AlertDaiLog")),
          ElevatedButton(onPressed: _simpleDialog, child: Text("SimpleDialog")),
          ElevatedButton(
              onPressed: showListDialog, child: Text("showListDialog")),
          ElevatedButton(
              onPressed: () {
                request();
              },
              child: Text("发送网络")),
        ],
      ),
    );
  }

  bool _loading = false;

  request() async {
    setState(() {
      _loading = true;
    });
    try {
      HttpClient httpClient = HttpClient();
      httpClient.connectionTimeout = Duration(seconds: 5);
      httpClient.idleTimeout = Duration(seconds: 10);
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse("https://www.baidu.com"));

      request.headers.add(
        "user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
      );
      HttpClientResponse response = await request.close();
      String content = await response.transform(utf8.decoder).join();
      print(response.statusCode);
      print(content);
      httpClient.close();
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
