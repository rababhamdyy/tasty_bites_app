import 'package:flutter/material.dart';
import 'package:tasty_bites_app/services/recipe_service.dart';
import 'package:tasty_bites_app/views/recipe_detail_view.dart';
import 'package:tasty_bites_app/widgets/recipe_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<dynamic> recipes = [];
  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    recipes = await RecipeService().getRecipes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasty Bites"),
        centerTitle: true,
        backgroundColor: Colors.lime,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),

      body:
          recipes.isEmpty
              ? Center(child: CircularProgressIndicator(color: Colors.lime))
              : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return RecipeWidget(
                    recipe: recipes[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => RecipeDetailView(recipe: recipes[index]),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
