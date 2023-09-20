import 'package:tech_task/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  final String title;
  final List<String> ingredients;
  RecipeModel({
    this.title,
    this.ingredients,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'ingredients': ingredients,
    };
  }

  factory RecipeModel.fromJson(Map<String, dynamic> map) {
    return RecipeModel(
      title: map['title'] ?? '',
      ingredients: List<String>.from(map['ingredients']),
    );
  }
  RecipeEntity toEntity() => RecipeEntity(
        title: title,
        ingredients: ingredients,
      );
}
