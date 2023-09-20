import 'package:tech_task/data/models/ingredient_model.dart';
import 'package:tech_task/data/models/recipe_model.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';
import 'package:tech_task/domain/entities/recipe_entity.dart';

const String dummyIngredientJsonUrl =
    "helpers/dummy_data/dummy_ingredient_response.json";
const String dummyRecipeJsonUrl =
    "helpers/dummy_data/dummy_recipe_response.json";
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
final testRecipeModel = RecipeModel(
  title: 'Ham and Cheese Toastie',
  ingredients: [
    "Ham",
    "Cheese",
    "Bread",
    "Butter",
  ],
);
final testRecipeEntity = RecipeEntity(
  title: 'Ham and Cheese Toastie',
  ingredients: [
    "Ham",
    "Cheese",
    "Bread",
    "Butter",
  ],
);
final testRecipeEntityList = [
  RecipeEntity(
    title: 'Ham and Cheese Toastie',
    ingredients: [
      "Ham",
      "Cheese",
      "Bread",
      "Butter",
    ],
  )
];
