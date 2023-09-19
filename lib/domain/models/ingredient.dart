import 'dart:convert';

class IngredientModel {
  final String title;
  final DateTime useBy;
  IngredientModel({
    this.title,
    this.useBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'use_by': useBy.millisecondsSinceEpoch,
    };
  }

  factory IngredientModel.fromMap(Map<String, dynamic> map) {
    return IngredientModel(
      title: map['title'] ?? '',
      useBy: DateTime.tryParse(map['use-by']),
    );
  }

  String toJson() => json.encode(toMap());

  factory IngredientModel.fromJson(String source) =>
      IngredientModel.fromMap(json.decode(source));
}
