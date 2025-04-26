import 'package:flutter/material.dart';
import 'package:tasty_bites_app/widgets/reciepe_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasty Bites"),
        centerTitle: true,
        backgroundColor: Colors.lime,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),

      body: ReciepeWidget(),
    );
  }
}
