import 'package:booky/core/models/book_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<BookModel> booksss;

  HomeSuccessState(this.booksss);
}

class HomeLoadingState extends HomeStates {}

class HomeFailureState extends HomeStates {
  final String errorMessage;

  HomeFailureState(this.errorMessage); 

}
