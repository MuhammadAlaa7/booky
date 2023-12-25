import 'package:booky/core/models/book_model.dart';

abstract class RelatedBooksStates {}

class RelatedBooksInitialState extends RelatedBooksStates {}

class RelatedBooksSuccessState extends RelatedBooksStates {
  final List<BookModel> relatedBooks;

  RelatedBooksSuccessState(this.relatedBooks);
}

class RelatedBooksLoadingState extends RelatedBooksStates {}

class RelatedBooksFailureState extends RelatedBooksStates {
  final String errorMessage;

  RelatedBooksFailureState(this.errorMessage); 

}
