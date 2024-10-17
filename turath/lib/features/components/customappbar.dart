import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  const Customappbar({
    super.key,
    required this.name,
  });

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: AppColors.primaryColor,
            size: 40,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          name,
          style: TextStyle(
            color: AppColors.textColorPrimary,
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 15),
          child: Icon(
            Icons.castle_rounded,
            size: 40,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
