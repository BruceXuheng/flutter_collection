import 'package:flutter/material.dart';

class ProudctDetailPage extends StatelessWidget {
  final String title;
  const ProudctDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${title}")),
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
