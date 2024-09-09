import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';
import 'book_item_image.dart';
import 'book_rating.dart';

class BooksDetailsSection extends StatelessWidget {
  final BookModel bookModel;

  const BooksDetailsSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.22),
          child: BookItemImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                  Assets.testImage),
        ),
        SizedBox(height: 25.h),
        Text(
          bookModel.volumeInfo.title!,
          style: TextStyles.font30Regular,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.h),
        Text(
          bookModel.volumeInfo.authors![0],
          style: TextStyles.font18Regular,
        ),
        SizedBox(height: 5.h),
        BookRating(
          rating: bookModel.volumeInfo.averageRating?? 0 ,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        SizedBox(height: 40.h),
        BooksActionButton(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
