import 'package:flutter/material.dart';
import 'package:food_recipe_app/recipe_details.dart';
import 'api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> meals;

  @override
  void initState() {
    super.initState();
    meals = ApiService().fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Recipes')),
      body: FutureBuilder<List<dynamic>>(
        future: meals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final mealList = snapshot.data!;
            return ListView.builder(
              itemCount: mealList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(mealList[index]['strMeal']),
                  onTap: () {
                    // Navigate to Recipe Detail Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => RecipeDetailScreen(
                              mealName: mealList[index]['strMeal'],
                            ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
