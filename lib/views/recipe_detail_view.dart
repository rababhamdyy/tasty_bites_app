import 'package:flutter/material.dart';
import 'package:tasty_bites_app/models/recipe_model.dart';
import 'package:tasty_bites_app/widgets/recipe_header.dart';
import 'package:tasty_bites_app/widgets/recipe_info_row.dart';
import 'package:tasty_bites_app/widgets/ingredients_list.dart';
import 'package:tasty_bites_app/widgets/instructions_list.dart';

class RecipeDetailView extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetailView({super.key, required this.recipe});

  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            RecipeHeader(
              imageUrl: widget.recipe.imageUrl,
              rating: widget.recipe.rating,
              reviewCount: widget.recipe.reviewCount,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    widget.recipe.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RecipeInfoRow(
                    firstIcon: Icons.room_service_outlined,
                    firstText: "${widget.recipe.servings} servings",
                    secondIcon: Icons.access_time,
                    secondText: "${widget.recipe.cookTimeMinutes} min",
                  ),
                  const SizedBox(height: 10),
                  RecipeInfoRow(
                    firstIcon: Icons.fastfood_outlined,
                    firstText: widget.recipe.mealType.join(', '),
                    secondIcon: Icons.restaurant,
                    secondText: widget.recipe.cuisine,
                  ),
                  const SizedBox(height: 20),
                  ToggleButtons(
                    isSelected: [_selectedTab == 0, _selectedTab == 1],
                    onPressed: (int index) {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    fillColor: Colors.blue[900],
                    selectedColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                    constraints: BoxConstraints(
                      minHeight: 40,
                      minWidth: MediaQuery.of(context).size.width * 0.35,
                    ),
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Ingredients'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Instructions'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _selectedTab == 0
                      ? IngredientsList(ingredients: widget.recipe.ingredients)
                      : InstructionsList(instructions: widget.recipe.instructions),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}