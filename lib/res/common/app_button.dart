import 'package:flutter/material.dart';
import 'package:to_do_screens/res/constant/colors.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;
  const AppButton({Key? key, this.title, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45,
      width: width ?? 120,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title ?? "",
        style: const TextStyle(
          fontSize: 20,
          color: AppColors.lightTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
