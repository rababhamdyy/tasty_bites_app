import 'package:json_annotation/json_annotation.dart';
part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe {
  final String name;
  final String imageUrl;
  final double rating;
  final int ingredientsCount;
  final int calories;
  final int reviewCount;
  final List<String> mealType;
  final String cuisine;
  final int cookTimeMinutes;
  final int servings;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.ingredientsCount,
    required this.calories,
    required this.reviewCount,
    required this.mealType,
    required this.cuisine,
    required this.cookTimeMinutes,
    required this.servings,
    required this.ingredients,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  static Recipe fromJsonWithDefaults(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] ?? 'Name not available',
      imageUrl: json['image'] ?? '',
      rating:
          (json['rating'] != null) ? (json['rating'] as num).toDouble() : 0.0,
      ingredientsCount: (json['ingredients'] as List<dynamic>?)?.length ?? 0,
      calories: json['caloriesPerServing'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      mealType:
          (json['mealType'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      cuisine: json['cuisine'] ?? 'Cuisine not available',
      cookTimeMinutes: json['cookTimeMinutes'] ?? 0,
      servings: json['servings'] ?? 0,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      instructions: (json['instructions'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}
