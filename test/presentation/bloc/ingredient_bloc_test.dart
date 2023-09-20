import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_state.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  MockGetRecipeUseCase mockGetRecipeUseCase;
  RecipeBloc recipeBloc;
  setUp(() {
    mockGetRecipeUseCase = MockGetRecipeUseCase();
    recipeBloc = RecipeBloc(mockGetRecipeUseCase);
  });

  test('Initial state is empty', () {
    expect(recipeBloc.state, NoIngredient());
  });
}
