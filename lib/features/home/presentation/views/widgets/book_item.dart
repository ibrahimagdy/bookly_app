import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      height: 225.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.testImage),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}
