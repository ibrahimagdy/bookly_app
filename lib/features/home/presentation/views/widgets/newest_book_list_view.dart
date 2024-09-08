import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBookListView extends StatelessWidget {
  const NewestBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 14,
        (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: const BestSellerBookItem(),
        ),
      ),
    );
  }
}
