import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/cubit/app_cubit.dart';
import 'package:restaurant_app/data/foodList.dart';
import 'package:restaurant_app/utils/app_theme.dart';

import '../cubit/app_state.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.foodItem});
  final FoodList foodItem;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xFFf8864c), Color(0xFFf85968)],
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topAppBarWidget(
                    context,
                    state,
                  ),
                  bodyWidget(context, state),
                  bottomWidget(state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Row bottomWidget(AppState state) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 35, left: 20),
          child: Text(
            '${state.foodOrderNumber} Items',
            style: AppTheme.getTextTheme(null).bodyLarge!.copyWith(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, left: 75),
          child: Text(
            '\$${state.foodPrice}',
            style: AppTheme.getTextTheme(null)
                .titleLarge!
                .copyWith(color: Colors.white, fontSize: 30),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 90, top: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF191a25),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(bottom: 11, left: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red),
              )
            ],
          ),
        )
      ],
    );
  }

  Container bodyWidget(BuildContext context, AppState state) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 18, top: 40),
            width: 300,
            child: Text(
              foodItem.name,
              textAlign: TextAlign.start,
              style: AppTheme.getTextTheme(null)
                  .titleLarge!
                  .copyWith(fontSize: 26),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 20),
            child: Text(
              'By Resto Parmoto Bapo',
              style: AppTheme.getTextTheme(null)
                  .bodySmall!
                  .copyWith(color: Colors.grey),
            ),
          ),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 65,
                      height: 30,
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 190, 186, 186)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '4.9',
                            style: AppTheme.getTextTheme(null)
                                .bodyMedium!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 85,
                      height: 30,
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 190, 186, 186)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scaleX: -1,
                            child: Image.asset(
                              'assets/images/bike.png',
                              width: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '20 min',
                            style: AppTheme.getTextTheme(null)
                                .bodyMedium!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 120,
                      decoration: BoxDecoration(
                        color: darkGrey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => context
                                .read<AppCubit>()
                                .increaseAndDecreaseFoodOrder(
                                    true, foodItem.price),
                            child: Container(
                              margin: const EdgeInsets.only(top: 1.5),
                              width: 55,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: lightGrey,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => context
                                .read<AppCubit>()
                                .increaseAndDecreaseFoodOrder(
                                    false, foodItem.price),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 45, top: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      foodItem.image,
                      fit: BoxFit.cover,
                      width: 330,
                      height: 330,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 34, left: 24),
            child: Text(
              Strings.description,
              style: AppTheme.getTextTheme(null).titleLarge!.copyWith(),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(right: 22, left: 22, top: 10, bottom: 30),
            child: Text(
              Strings.foodDesc[0],
              textAlign: TextAlign.justify,
              maxLines: 3,
              style: AppTheme.getTextTheme(null)
                  .bodyMedium!
                  .copyWith(color: Colors.black.withOpacity(0.5), fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Container topAppBarWidget(BuildContext context, AppState state) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 20, right: 20),
          //   child: state.likedFoodList.contains(
          //     int.parse(index),
          //   )
          //       ? Container(
          //           margin: const EdgeInsets.only(right: 8),
          //           child: const Icon(
          //             CupertinoIcons.heart_fill,
          //             size: 30,
          //             color: Colors.red,
          //           ),
          //         )
          //       : Container(
          //           margin: const EdgeInsets.only(right: 8),
          //           child: const Icon(
          //             CupertinoIcons.heart,
          //             size: 30,
          //           ),
          //         ),
          // )
        ],
      ),
    );
  }
}
