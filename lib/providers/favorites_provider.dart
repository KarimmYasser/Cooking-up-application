import 'package:cooking_up/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsProvider extends StateNotifier<List<Meal>> {
  FavoriteMealsProvider() : super([]);

  bool toggleFavoriteStatus(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsProvider, List<Meal>>((ref) {
  return FavoriteMealsProvider();
});
