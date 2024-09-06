import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsView extends StatelessWidget{
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              const BookDetailsAppBar(),
              SizedBox(height: 13.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuery.width*0.2),
                child: const BookItemImage(),
              ),
              SizedBox(height: 25.h),
              Text(
                'The Jungle Book',
                style: TextStyles.font30Regular,
              ),
              SizedBox(height: 10.h),
              Text(
                'Rudyard Kipling',
                style: TextStyles.font18Regular,
              ),
              SizedBox(height: 10.h),
              const BookRating(),
            ],
          ),
        ),
      ),
    );
  }
}