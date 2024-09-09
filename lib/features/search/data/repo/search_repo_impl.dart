import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/networking/api_service.dart';

class SearchRepoImpl extends SearchRepo{
  final ApiService apiService;
  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchResult({required String subject}) async{
    try {
      var data = await apiService.getRequest(endPoint: 'volumes?Filtering=free-ebooks&q=subject:$subject');
      List<BookModel> books = [];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if(e is DioException){
        return Left(ServiceFailure.fromDioError(e));
      }
      return Left(ServiceFailure(e.toString()));
    }
  }
}
