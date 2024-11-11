import 'package:booky/core/models/book_model.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<BookModel> searchedBooks;

  SearchSuccessState(this.searchedBooks);
}

class SearchLoadingState extends SearchStates {}

class SearchFailureState extends SearchStates {
  final String errorMessage;

  SearchFailureState(this.errorMessage); 

}
