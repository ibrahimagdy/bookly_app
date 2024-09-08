import 'package:bookly_app/core/helpers/extensions.dart';
import 'package:bookly_app/core/routing/routes.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';

class NewestBookItem extends StatelessWidget {
  final BookModel bookModel;
  const NewestBookItem({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.details),
      child: Row(
        children: [
          Container(
            width: 83.w,
            height: 113.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(bookModel.volumeInfo.imageLinks!.smallThumbnail),
              ),
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 196.w,
                  child: Text(
                    bookModel.volumeInfo.title!,
                    style: TextStyles.font20Regular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  bookModel.volumeInfo.authors![0],
                  style: TextStyles.font14Regular,
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      'Free',
                      style: TextStyles.font20Bold,
                    ),
                    SizedBox(width: 50.w),
                    BookRating(
                      rating: bookModel.volumeInfo.averageRating?.round()?? 0,
                      count: bookModel.volumeInfo.ratingsCount?? 0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
