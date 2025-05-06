import 'package:tasty_bites_app/models/recipe_model.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<Recipe> recipes;
  final String selectedDifficulty;

  RecipeLoaded({
    required this.recipes,
    required this.selectedDifficulty,
  });
}

class RecipeError extends RecipeState {
  final String message;

  RecipeError({required this.message});
}