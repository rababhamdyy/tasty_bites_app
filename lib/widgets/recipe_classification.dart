import 'package:flutter/material.dart';

class RecipeClassification extends StatelessWidget {
  final List<String> recipeClassification = ['Easy', 'Medium', 'All'];
  final Function(String) onCategorySelected;
  final String selectedCategory;

  RecipeClassification({
    super.key,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            recipeClassification.map((category) {
              bool isSelected = category == selectedCategory;
              return GestureDetector(
                onTap: () {
                  onCategorySelected(
                    category,
                  ); // Call the callback when a category is selected
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue[900] : Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.blue[900],
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
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
