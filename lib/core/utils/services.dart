import 'package:booky/core/models/book_model.dart';
import 'package:booky/core/utils/api.dart';

class BooklyServices {
  static Future<List<BookModel>> getNewestBooks() async {
    List<dynamic> data = await BooklyApi.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming&sorting=newest');
    List<BookModel> books = [];
    for (var book in data) {
      books.add(
        BookModel.fromJson(book),
      );
    }
    print(books[0].volumeInfo!.title);
    return books;
  }

  static Future<List<BookModel>> getBooksByCategory({required categoryTitle }) async {
    List<dynamic> data = await BooklyApi.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:$categoryTitle');
    List<BookModel> programmingBooks = [];
    for (var book in data) {
      programmingBooks.add(
        BookModel.fromJson(book),
      );
    }
    print(programmingBooks[0].volumeInfo!.title);
    return programmingBooks;
  }
}
