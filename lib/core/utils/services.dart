import 'package:booky/core/models/book_model.dart';
import 'package:booky/core/utils/api.dart';

class BooklyServices {
  static Future<List<BookModel>> getNewestBooks() async {
    List<dynamic> data = await BooklyApi.get(
        endPoint: 'volumes?filtering=free-ebooks&q=programming&orderBy=newest');
    List<BookModel> books = [];
    for (var book in data) {
      books.add(
        BookModel.fromJson(book),
      );
    }
    print(books[0].volumeInfo!.title);
    return books;
  }

  static Future<List<BookModel>> getBooksByCategory(
      {required categoryTitle}) async {
    List<dynamic> data = await BooklyApi.get(
        endPoint: 'volumes?filtering=free-ebooks&q=subject:$categoryTitle');
    List<BookModel> programmingBooks = [];
    for (var book in data) {
      programmingBooks.add(
        BookModel.fromJson(book),
      );
    }
    print(programmingBooks[0].volumeInfo!.title);
    return programmingBooks;
  }

  static Future<List<BookModel>> getRelatedBooks({
    required String categoryTitle,
  }) async {
    List<dynamic> data = await BooklyApi.get(
        endPoint:
            'volumes?filtering=free-ebooks&q=subject:$categoryTitle&orderBy=relevance');
    List<BookModel> relatedBooks = [];
    for (var book in data) {
      relatedBooks.add(
        BookModel.fromJson(book),
      );
    }
    print(relatedBooks[0].volumeInfo!.title);
    return relatedBooks;
  }

  static Future<List<BookModel>> getSearchedBooks(
      {required String bookName}) async {
    List<dynamic> data = await BooklyApi.get(
        endPoint: 'volumes?filtering=free-ebooks&q=$bookName');
    List<BookModel> searchedBooks = [];
    data.map((book) {
      searchedBooks.add(BookModel.fromJson(book));
    }).toList();
    return searchedBooks;
  }
}
