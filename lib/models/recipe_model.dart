import 'package:json_annotation/json_annotation.dart';
part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe {
  final String name;
  final String imageUrl;
  final double rating;
  final int ingredientsCount;
  final int calories;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.ingredientsCount,
    required this.calories,
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
    );
  }
}
