import 'package:bookly_app/core/widgets/custom_circle_progress_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_item.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_result_cubit/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (state is SearchResultSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: NewestBookItem(bookModel: state.books[index]),
              );
            },
          );
        }
        else if (state is SearchResultFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else{
          return const CustomCircleProgressIndicator();
        }
      },
    );
  }
}
