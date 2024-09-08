import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/networking/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getRequest(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming');
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

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.getRequest(endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
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