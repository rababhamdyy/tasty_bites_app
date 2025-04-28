// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  name: json['name'] as String,
  imageUrl: json['image'] as String,
  rating: (json['rating'] as num).toDouble(),
  ingredientsCount:
      (json['ingredients'] as List<dynamic>).length,
  calories: (json['caloriesPerServing'] as num).toInt(),
);

// Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
//   'name': instance.name,
//   'image': instance.imageUrl,
//   'rating': instance.rating,
//   'ingredients': instance.ingredientsCount,
//   'caloriesPerServing': instance.calories,
// };
