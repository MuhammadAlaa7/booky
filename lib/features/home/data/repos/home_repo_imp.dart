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
  Future<List<BookModel>> fetchBooksByCategory({
    required String categoryTitle,
  }) async {
    return await BooklyServices.getBooksByCategory(
      categoryTitle: categoryTitle,
    );
  }

  Future<List<BookModel>> fetchRelatedBooks({
    required String categoryTitle,
  }) async {
    return await BooklyServices.getRelatedBooks(
      categoryTitle: categoryTitle,
    );
  }
}
