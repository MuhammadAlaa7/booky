import 'package:booky/core/models/book_model.dart';
import 'package:booky/features/home/data/repos/home_repo_imp.dart';
import 'package:booky/features/home/presentation/controller/related_books_cubit/related_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksStates> {
  RelatedBooksCubit() : super(RelatedBooksInitialState());


  List<BookModel> relatedBooks = [];

  Future<void > fetchRelatedBooks({required String categoryTitle}) async {
    print('test  related ');
    relatedBooks = await HomeRepoImp().fetchRelatedBooks(categoryTitle: categoryTitle );
    emit(RelatedBooksSuccessState(relatedBooks));
    print('from cubit ${relatedBooks[0].volumeInfo!.title}');
  }
}
