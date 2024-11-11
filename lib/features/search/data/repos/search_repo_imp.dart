import 'package:booky/core/models/book_model.dart';
import 'package:booky/features/search/data/repos/serach_repo.dart';

import '../../../../core/utils/services.dart';

class SearchRepoImp implements SearchRepo {
  @override
 static Future<List<BookModel>> fetchSearchedBooks({required String bookName}) async {
   return await BooklyServices.getSearchedBooks(bookName: bookName);
  }
}
