import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25),
            width: 40,
            height: 40,
            child: Icon(
              Icons.home_filled,
              size: 30,
              color: red,
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              CupertinoIcons.heart,
              size: 27,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(
            width: 47,
            height: 47,
            child: Container(
              decoration: BoxDecoration(
                color: darkGrey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  const Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 2, top: 1),
                    alignment: Alignment.topRight,
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      child: const CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              Icons.discount_outlined,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 25),
            width: 40,
            height: 40,
            child: Icon(
              CupertinoIcons.person,
              color: Colors.black.withOpacity(0.5),
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
