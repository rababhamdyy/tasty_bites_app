// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  name: json['name'] as String,
  imageUrl: json['image'] as String,
  rating: (json['rating'] as num).toDouble(),
  ingredientsCount: (json['ingredients'] as List<dynamic>).length,
  calories: (json['caloriesPerServing'] as num).toInt(),
  reviewCount: json['reviewCount'] as int,
  mealType: json['mealType'] as List<String>,
  cuisine: json['cuisine'] as String,
  cookTimeMinutes: json['cookTimeMinutes'] as int,
  servings: json['servings'] as int,
  ingredients: json['ingredients'] as List<String>,
  instructions: json['instructions'] as List<String>,
  difficulty: json['difficulty'] as String,
);

// Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
//   'name': instance.name,
//   'image': instance.imageUrl,
//   'rating': instance.rating,
//   'ingredients': instance.ingredientsCount,
//   'caloriesPerServing': instance.calories,
//   'reviewCount': instance.reviewCount,
//   'mealType': instance.mealType,
//   'cuisine': instance.cuisine,
//   'cookTimeMinutes': instance.cookTimeMinutes,
//   'servings': instance.servings,
//   'ingredients': instance.ingredients,
//   'instructions': instance.instructions,
// };
