import 'package:flutter/material.dart';

class ProudctDetailPageFrom  extends StatelessWidget {
  final Map arguments;
    ProudctDetailPageFrom({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${arguments["title"]}")),
      body: Container(
        child: Column(
          children: [
            Text("data"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("data1213"))
          ],
        ),
      ),
    );
  }
}
