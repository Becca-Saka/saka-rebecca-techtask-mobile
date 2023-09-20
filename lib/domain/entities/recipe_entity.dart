import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final String title;
  final List<String> ingredients;
  RecipeEntity({
    this.title,
    this.ingredients,
  });

  @override
  List<Object> get props => [title, ingredients];
}
