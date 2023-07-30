import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(
              likedFoodList: [],
              foodOrderNumber: 1,
              foodPrice: 0,
              selectedCategory: 0),
        );
  List<String> likedFoodIndex = [];

  void selectCategory(int selectedIndex) {
    emit(
      state.copyWith(selectedCategory: selectedIndex),
    );
  }

  final likedFoods = <int>[];
  void likeDislikeFood(int index) {
    final isSelectedItem = state.likedFoodList.indexWhere(
      (selected) => selected == index,
    );

    if (isSelectedItem >= 0) {
      likedFoods.removeAt(isSelectedItem);
    } else {
      likedFoods.add(index);
    }

    emit(
      state.copyWith(
        likedFoodList: List.from(likedFoods),
      ),
    );

    print('testing ${state.likedFoodList}');
  }

  void determineFoodPrice(double foodPrice) {
    emit(
      state.copyWith(foodPrice: state.foodOrderNumber * foodPrice),
    );
  }

  void increaseAndDecreaseFoodOrder(bool isIncrease, double foodPrice) {
    emit(
      state.copyWith(
        foodOrderNumber: isIncrease
            ? state.foodOrderNumber + 1
            : state.foodOrderNumber > 0
                ? state.foodOrderNumber - 1
                : 0,
      ),
    );
    emit(
      state.copyWith(foodPrice: (state.foodOrderNumber) * foodPrice),
    );
  }

  void clearStatesValues() {
    emit(
      state.copyWith(
        foodOrderNumber: 1,
        foodPrice: 0,
      ),
    );
  }
}
