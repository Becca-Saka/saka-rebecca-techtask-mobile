import 'package:tech_task/data/models/ingredient_model.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';

const String dummyJsonUrl = "helpers/dummy_data/dummy_ingredient_response.json";
final testIngredientModel = IngredientModel(
  title: 'Ham',
  useBy: DateTime.parse('2019-11-25'),
);
final testIngredientModelList = [
  IngredientModel(
    title: 'Ham',
    useBy: DateTime.parse('2019-11-25'),
  )
];
final testIngredientEntity = IngredientEntity(
  title: 'Ham',
  useBy: DateTime.parse('2019-11-25'),
);
final testIngredientEntityList = [
  IngredientEntity(
    title: 'Ham',
    useBy: DateTime.parse('2019-11-25'),
  )
];
