import 'package:flutter/material.dart';
import 'package:tasty_bites_app/models/recipe_model.dart';

class RecipeDetailView extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
          Expanded(
            child: Container(color: Colors.white, padding: EdgeInsets.all(20)),
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
    path.lineTo(0, size.height * 0.8);

    path.cubicTo(
      size.width * 0.2,
      size.height,
      size.width * 0.5,
      size.height * 0.6,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
