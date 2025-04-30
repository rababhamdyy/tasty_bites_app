import 'package:flutter/material.dart';
import 'package:tasty_bites_app/models/recipe_model.dart';

class RecipeDetailView extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetailView({super.key, required this.recipe});

  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Image.network(
                    widget.recipe.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 400,
                        color: Colors.grey[200],
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue[900],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 340,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(220),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 8),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 5),
                        Text(
                          widget.recipe.rating.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " | ${widget.recipe.reviewCount} reviews",
                          style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    widget.recipe.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildInfoRow(
                    Icons.room_service_outlined,
                    "${widget.recipe.servings} servings",
                    Icons.access_time,
                    "${widget.recipe.cookTimeMinutes} min",
                  ),
                  SizedBox(height: 10),
                  _buildInfoRow(
                    Icons.fastfood_outlined,
                    widget.recipe.mealType.join(', '),
                    Icons.restaurant,
                    widget.recipe.cuisine,
                  ),
                  SizedBox(height: 20),
                  ToggleButtons(
                    isSelected: [_selectedTab == 0, _selectedTab == 1],
                    onPressed: (int index) {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    fillColor: Colors.blue[900],
                    selectedColor: Colors.white,
                    textStyle: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                    constraints: BoxConstraints(
                      minHeight: 40,
                      minWidth: MediaQuery.of(context).size.width * 0.35,
                    ),
                    children: [
                      _buildToggleButtonChild('Ingredients'),
                      _buildToggleButtonChild('Instructions'),
                    ],
                  ),
                  SizedBox(height: 20),
                  _selectedTab == 0
                      ? _buildIngredients(widget.recipe)
                      : _buildInstructions(widget.recipe),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData firstIcon,
    String firstText,
    IconData secondIcon,
    String secondText,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(firstIcon, size: 16, color: Colors.grey[800]),
        SizedBox(width: 5),
        Text(firstText, style: _infoTextStyle),
        SizedBox(width: 15),
        Icon(secondIcon, size: 16, color: Colors.grey[800]),
        SizedBox(width: 5),
        Text(secondText, style: _infoTextStyle),
      ],
    );
  }

  Widget _buildToggleButtonChild(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(text),
    );
  }

  final TextStyle _infoTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    color: Colors.grey[800],
  );

  Widget _buildIngredients(Recipe recipe) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients:',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: recipe.ingredients.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.blue[900]),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          recipe.ingredients[index],
                          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions(Recipe recipe) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Instructions:',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: recipe.instructions.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          recipe.instructions[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            height: 1.5,
                          ),
                        ),
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
    final path = Path();
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
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
