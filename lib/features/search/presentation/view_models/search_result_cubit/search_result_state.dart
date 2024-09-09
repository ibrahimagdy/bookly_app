part of 'search_result_cubit.dart';

class SearchResultState {}

final class SearchResultInitial extends SearchResultState {}
final class SearchResultLoading extends SearchResultState {}
final class SearchResultSuccess extends SearchResultState {
  final List<BookModel> books;
  SearchResultSuccess(this.books);
}
final class SearchResultFailure extends SearchResultState {
  final String errMessage;
  SearchResultFailure(this.errMessage);
}
