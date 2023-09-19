import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable {
  final String title;
  final DateTime useBy;
  IngredientEntity({
    this.title,
    this.useBy,
  });

  @override
  // TODO: implement props
  List<Object> get props => [title, useBy];
}
