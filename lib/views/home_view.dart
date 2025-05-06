import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bites_app/cubits/recipe_cubit.dart';
import 'package:tasty_bites_app/cubits/recipe_state.dart';
import 'package:tasty_bites_app/views/recipe_detail_view.dart';
import 'package:tasty_bites_app/widgets/recipe_classification.dart';
import 'package:tasty_bites_app/widgets/recipe_widget.dart';

class HomeView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasty Bites"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[900],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.blue[900]),
            );
          } else if (state is RecipeLoaded) {
            return Column(
              children: [
                RecipeClassification(
                  selectedCategory: state.selectedDifficulty,
                  onCategorySelected: (difficulty) {
                    context.read<RecipeCubit>().getRecipes(difficulty);
                    _scrollController.jumpTo(0);
                  },
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await context.read<RecipeCubit>().loadInitialData();
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        return RecipeWidget(
                          recipe: state.recipes[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => RecipeDetailView(
                                      recipe: state.recipes[index],
                                    ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else if (state is RecipeError) {
            return Center(child: Text(state.message));
          } else {
            return Center(
              child: Text(
                'No Recipe Found',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
