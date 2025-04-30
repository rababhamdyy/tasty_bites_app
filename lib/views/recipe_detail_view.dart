import 'package:flutter/material.dart';
import 'package:tasty_bites_app/models/recipe_model.dart';

class RecipeDetailView extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                ),
              ),
              Positioned(
                top: 30,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                right: 25,
                top: 340,
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[400]),
                    SizedBox(width: 5),
                    Text(
                      recipe.rating.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      " | ${recipe.reviewCount} reviews",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    recipe.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Icon(
                        Icons.room_service_outlined,
                        color: Colors.grey[800],
                        size: 16,
                      ),
                      Text(
                        "${recipe.servings}",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey[800],
                        ),
                      ),
                      Icon(
                        Icons.access_time,
                        color: Colors.grey[800],
                        size: 16,
                      ),
                      Text(
                        "${recipe.cookTimeMinutes} min",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Icon(
                        Icons.fastfood_outlined,
                        color: Colors.grey[800],
                        size: 16,
                      ),
                      Text(
                        recipe.mealType.join(' , '),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey[800],
                        ),
                      ),
                      Icon(Icons.restaurant, color: Colors.grey[800], size: 16),
                      Text(
                        recipe.cuisine,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.9);
    path.cubicTo(
      size.width * 0.2,
      size.height * 0.8,
      size.width * 0.5,
      size.height * 0.85,
      size.width,
      size.height * 0.7,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
