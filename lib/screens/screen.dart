import 'package:coffee/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      url,
      height: size(context).height * .3,
      width: size(context).height * .3,
    );
  }
}
