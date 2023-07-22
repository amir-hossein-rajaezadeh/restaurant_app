import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(
            likedFoodList: [],
          ),
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
}
