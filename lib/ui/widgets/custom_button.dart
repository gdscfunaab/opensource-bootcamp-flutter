import 'package:flutter/material.dart';
import 'package:wpay/constants/colors.dart';
import 'package:wpay/constants/size_config.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: const BoxDecoration(
              color: customButtonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: SizeConfig.fromHeight(context, 5),
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontSize: SizeConfig.fontSize(context, 5),
                      color: Colors.white,
                      fontWeight: FontWeight.w500)))),
    );
  }
}
