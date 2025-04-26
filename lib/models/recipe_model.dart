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
}

final List<Recipe> getRecipes = [
  Recipe(
    name: "Classic Margherita Pizza",
    imageUrl: "assets/images/pizza.webp",
    rating: 4.6,
    ingredientsCount: 6,
    calories: 300,
  ),
  Recipe(
    name: "Vegetarian Stir-Fry",
    imageUrl: "assets/images/stir_fry.jpg",
    rating: 4.7,
    ingredientsCount: 9,
    calories: 250,
  ),
  Recipe(
    name: "Chocolate Chip Cookies",
    imageUrl: "assets/images/cookies.jpg",
    rating: 4.9,
    ingredientsCount: 9,
    calories: 150,
  ),
];
