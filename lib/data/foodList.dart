import 'package:flutter/material.dart';

@immutable
class FoodList {
  final String name;
  final String image;
  final String description;
  final double price;

  const FoodList(this.name, this.image, this.description, this.price);
}
