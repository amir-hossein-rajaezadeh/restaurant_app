import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

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

  final myList = <int>[];
  void test(int index) {
    myList.add(index);
    emit(state.copyWith(likedFoodList: myList));

    print('testing ${state.likedFoodList}');
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
