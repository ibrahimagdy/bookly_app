import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.testImage),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
