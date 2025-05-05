import 'package:flutter/material.dart';

class RecipeClassification extends StatelessWidget {
  final List<String> recipeClassification = ['Easy', 'Medium', 'All'];

  RecipeClassification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: recipeClassification.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  category, 
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
