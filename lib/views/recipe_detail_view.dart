import 'package:flutter/material.dart';
import 'package:tasty_bites_app/models/recipe_model.dart';

class RecipeDetailView extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.lime,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          flexibleSpace: Image.network(
            recipe.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
      body: Center(child: Text("Recipe Details will be shown here.")),
    );
  }
}
