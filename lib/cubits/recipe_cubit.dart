import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bites_app/cubits/recipe_state.dart';
import 'package:tasty_bites_app/models/recipe_model.dart';
import 'package:tasty_bites_app/services/recipe_service.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeInitial()) {
    loadInitialData();
  }

  final RecipeService _recipeService = RecipeService();
  List<Recipe> _allRecipes = [];

  Future<void> loadInitialData() async {
    emit(RecipeLoading());
    try {
      _allRecipes = await _recipeService.getRecipes('All');
      emit(RecipeLoaded(
        recipes: _allRecipes,
        selectedDifficulty: 'All',
      ));
    } catch (e) {
      emit(RecipeError(message: e.toString()));
    }
  }

  Future<void> getRecipes(String difficulty) async {
    if (_allRecipes.isEmpty) {
      await loadInitialData();
      return;
    }

    final filteredRecipes = _allRecipes
        .where((recipe) => recipe.difficulty == difficulty || difficulty == 'All')
        .toList();

    emit(RecipeLoaded(
      recipes: filteredRecipes,
      selectedDifficulty: difficulty,
    ));
  }
}