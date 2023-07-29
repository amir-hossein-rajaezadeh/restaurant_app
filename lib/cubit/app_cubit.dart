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

  final selectedItems = <int>[];
  void likeAndUnlikeFood(int foodIndex) async {
    final isSelectedItem = selectedItems.indexWhere(
      (selected) => selected == foodIndex,
    );

    if (isSelectedItem >= 0) {
      emit(
        state.copyWith(
          likedFoodList: selectedItems..removeAt(isSelectedItem),
        ),
      );
    } else {
      emit(
        state.copyWith(
          likedFoodList: selectedItems..add(foodIndex),
        ),
      );
    }

    // likedFoodIndex.add(
    //   foodIndex.toString(),
    // );

    // emit(
    //   state.copyWith(likedFoodList: likedFoodIndex),
    // );
    print('likedFoodIndex is ${state.likedFoodList} , test $selectedItems');
  }

  void determineFoodPrice(double foodPrice) {
    emit(
      state.copyWith(foodPrice: state.foodOrderNumber * foodPrice),
    );
  }

  void increaseAndDecreaseFoodOrder(bool isIncrease, double foodPrice) {
    //Increase Number of Food Order
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
