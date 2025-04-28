import 'package:dio/dio.dart';
import 'package:tasty_bites_app/models/recipe_model.dart';

class RecipeService {
  final _dio = Dio();

  Future<List<dynamic>> getRecipes() async {
    final response = await _dio.get("https://dummyjson.com/recipes");

    Map<String, dynamic> data = response.data ?? {};

    List<dynamic> recipeData = data['recipes'] ?? [];

    List<Recipe> recipes =
        recipeData
            .map(
              (json) =>
                  Recipe.fromJsonWithDefaults(json as Map<String, dynamic>),
            )
            .toList();

    return recipes;
  }
}
