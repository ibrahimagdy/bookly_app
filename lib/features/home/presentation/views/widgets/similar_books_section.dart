import 'package:bookly_app/core/di/dependecy_injection.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksSection extends StatelessWidget {
  final BookModel bookModel;

  const SimilarBooksSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    final category = bookModel.volumeInfo.categories?.first ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You might also like',
          style: TextStyles.font14Regular.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 14.h),
        BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchSimilarBooks(category: category),
          child: const SimilarBooksListView(),
        ),
      ],
    );
  }
}
