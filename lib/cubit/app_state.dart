import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final List<String> likedFoodList;
  final int foodOrderNumber;
  final double foodPrice;
  final int selectedCategory;
  const AppState(
      {required this.likedFoodList,
      required this.foodOrderNumber,
      required this.foodPrice,
      required this.selectedCategory});

  AppState copyWith(
      {List<String>? likedFoodList,
      int? foodOrderNumber,
      double? foodPrice,
      int? selectedCategory}) {
    return AppState(
        selectedCategory: selectedCategory ?? this.selectedCategory,
        likedFoodList: likedFoodList ?? this.likedFoodList,
        foodOrderNumber: foodOrderNumber ?? this.foodOrderNumber,
        foodPrice: foodPrice ?? this.foodPrice);
  }

  @override
  List<Object?> get props =>
      [likedFoodList, foodOrderNumber, foodPrice, selectedCategory];
}
