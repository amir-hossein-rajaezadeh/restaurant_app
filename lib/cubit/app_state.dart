import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final List<String> likedFoodList;

  const AppState({required this.likedFoodList});

  AppState copyWith({List<String>? likedFoodList}) {
    return AppState(likedFoodList: likedFoodList ?? this.likedFoodList);
  }

  @override
  List<Object?> get props => [likedFoodList];
}
