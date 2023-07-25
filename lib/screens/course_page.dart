import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/see_all_row.dart';
import 'package:restaurant_app/utils/app_theme.dart';
import 'package:restaurant_app/utils/strings.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../utils/colors.dart';
import '../utils/image_list.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  lightYellowBackground,
                  white,
                  white,
                  white,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  appBarWidget(),
                  searchWidget(),
                  categoryListWidget(state),
                  const SizedBox(
                    height: 20,
                  ),
                  seeAllRowWidget(Strings.course),
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 3.30,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15),
                          itemCount: grildViewColorList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: grildViewColorList[index],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 15, left: 15),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      Strings.categoryListName[index],
                                      style: AppTheme.getTextTheme(null)
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        foodImageList[index],
                                        width: 140,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column categoryListWidget(AppState state) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20),
          alignment: Alignment.topLeft,
          child: Text(
            Strings.chooseCategory,
            style: AppTheme.getTextTheme(null)
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 90,
          child: ListView.separated(
            separatorBuilder: (context, index) => Container(
              width: 40,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categoryImageList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.read<AppCubit>().selectCategory(index),
                child: Container(
                  margin: EdgeInsets.only(left: index == 0 ? 30 : 0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: state.selectedCategory == index
                              ? creamy
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          child:
                              Image.asset(categoryImageList[index], width: 50),
                        ),
                      ),
                      Text(
                        Strings.foodList[index],
                        style: AppTheme.getTextTheme(null).bodyMedium,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container searchWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.search,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 1,
            height: 20,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: TextField(
                decoration: InputDecoration(
                    hintText: Strings.whatToEat,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row appBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.delivery,
                style: AppTheme.getTextTheme(null)
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w800, fontSize: 14),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                Strings.location,
                style: AppTheme.getTextTheme(null)
                    .bodyMedium!
                    .copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/profile.jpg',
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
        )
      ],
    );
  }
}
