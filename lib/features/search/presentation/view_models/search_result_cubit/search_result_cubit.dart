import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.searchRepo) : super(SearchResultInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchResult({required String subject}) async {
    emit(SearchResultLoading());
    var result = await searchRepo.fetchSearchResult(subject: subject);
    result.fold(
            (failure){
          emit(SearchResultFailure(failure.errMessage));
        },
            (books){
          emit(SearchResultSuccess(books));
        }
    );
  }
}
