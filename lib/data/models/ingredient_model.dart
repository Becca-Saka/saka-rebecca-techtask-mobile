import 'package:tech_task/domain/entities/ingredient_entity.dart';

class IngredientModel extends IngredientEntity {
  final String title;
  final DateTime useBy;
  IngredientModel({
    this.title,
    this.useBy,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'use-by': '${useBy.year}-${useBy.month}-${useBy.day}',
    };
  }

  factory IngredientModel.fromJson(Map<String, dynamic> map) {
    return IngredientModel(
      title: map['title'] ?? '',
      useBy: DateTime.tryParse(map['use-by']),
    );
  }
}
