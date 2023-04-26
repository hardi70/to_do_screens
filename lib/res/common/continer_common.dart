import 'package:flutter/material.dart';
import 'package:to_do_screens/res/constant/colors.dart';

class AppContainer extends StatelessWidget {
  final String? hintText;
  final bool? isData;
  final IconData? icon;
  const AppContainer({Key? key, this.hintText, this.isData, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.hintColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon!, color: Colors.pink),
          SizedBox(
            width: 6,
          ),
          Text(
            hintText ?? "",
            style: TextStyle(
              color: isData! ? AppColors.textColor : AppColors.textHintColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
