import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final List<String> likedFoodList;
  final int foodOrderNumber;
  final double foodPrice;

  const AppState(
      {required this.likedFoodList,
      required this.foodOrderNumber,
      required this.foodPrice});

  AppState copyWith(
      {List<String>? likedFoodList, int? foodOrderNumber, double? foodPrice}) {
    return AppState(
        likedFoodList: likedFoodList ?? this.likedFoodList,
        foodOrderNumber: foodOrderNumber ?? this.foodOrderNumber,
        foodPrice: foodPrice ?? this.foodPrice);
  }

  @override
  List<Object?> get props => [likedFoodList, foodOrderNumber, foodPrice];
}
