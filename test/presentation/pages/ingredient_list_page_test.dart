import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_event.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_state.dart';

class MockRecipeBloc extends MockBloc<RecipeEvent, RecipeState>
    implements RecipeBloc {}

void main() {
  MockRecipeBloc mockRecipeBloc;

  setUp(() {
    mockRecipeBloc = MockRecipeBloc();
  });

  test('', () {});
}
