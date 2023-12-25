import 'package:booky/features/search/data/repos/search_repo_imp.dart';
import 'package:booky/features/search/presentation/controller/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/book_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  List<BookModel> searchedBooks = [];

  Future<void> fetchSearchedBooks({required String bookName}) async {
    searchedBooks = await SearchRepoImp.fetchSearchedBooks(bookName: bookName);
    emit(SearchSuccessState(searchedBooks));
  }
}
