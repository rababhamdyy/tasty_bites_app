import 'package:flutter/material.dart';
import 'package:tasty_bites_app/widgets/recipe_widget.dart';
import 'package:tasty_bites_app/models/recipe_model.dart';

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

      body: ListView.builder(
        itemCount: getRecipes.length,
        itemBuilder: (context, index) {
          return RecipeWidget(reciepe: getRecipes[index]);
        },
      ),
    );
  }
}
