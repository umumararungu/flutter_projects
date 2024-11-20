import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String mealName;

  const RecipeDetailScreen({super.key, required this.mealName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mealName)),
      body: Center(child: Text('Detailed recipe for $mealName')),
    );
  }
}