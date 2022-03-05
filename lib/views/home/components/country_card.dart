import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:users/core/styles/app_text_styles.dart';

import '../../../core/styles/app_colors.dart';
import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  UserCard({
    Key? key,
    required this.users,
  }) : super(key: key);

  final UserList users;
  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    Color _color =
        _randomColor.randomColor(colorBrightness: ColorBrightness.light);
    return KeyedSubtree(
      key: ValueKey(users.id),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 1),
              )
            ],
            color: AppColors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.black),
                ),
                child: Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        users.name[0],
                        style: AppTextStyles.aBee24Black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      users.name,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${users.address!.city} , ${users.address!.zipcode}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
