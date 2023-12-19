import 'package:booky/core/models/book_model.dart';
import 'package:booky/core/utils/services.dart';
import 'package:booky/features/home/data/repos/home_repo.dart';

class HomeRepoImp extends HomeRepo {
// I think the end point should be passed here

  @override
  Future<List<BookModel>> fetchNewestBooks() async {
    return await BooklyServices.getNewestBooks();
  }

  @override
  @override
  Future<List<BookModel>> fetchBooksByCategory(
      {required String categoryTitle}) async {
    return await BooklyServices.getBooksByCategory(
        categoryTitle: categoryTitle);
  }

  fetchRelatedBooks() {
    // TODO: implement fetchRelatedBooks
    throw UnimplementedError();
  }

  @override
  fetchBusinessBooks() {
    // TODO: implement fetchBusinessBooks
    throw UnimplementedError();
  }

  @override
  fetchCookBooks() {
    // TODO: implement fetchCookBooks
    throw UnimplementedError();
  }

  @override
  fetchScienceBooks() {
    // TODO: implement fetchScienceBooks
    throw UnimplementedError();
  }
}
