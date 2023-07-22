import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(
              likedFoodList: [], foodOrderNumber: 1, foodPrice: 19.28),
        );
  List<String> likedFoodIndex = [];

  void likeAndUnlikeFood(int foodIndex) async {
    if (state.likedFoodList.last != foodIndex.toString()) {
      likedFoodIndex.add(
        foodIndex.toString(),
      );
    }
    emit(
      state.copyWith(likedFoodList: likedFoodIndex),
    );
    print('likedFoodIndex is ${state.likedFoodList}');
  }

  void increaseAndDecreaseFoodOrder(bool isIncrease) {
    //Increase Number of Food Order
    emit(
      state.copyWith(
          foodOrderNumber: isIncrease
              ? state.foodOrderNumber + 1
              : state.foodOrderNumber > 0
                  ? state.foodOrderNumber - 1
                  : 0,
          foodPrice: (state.foodOrderNumber + 1) * 19.24),
    );
  }
}
