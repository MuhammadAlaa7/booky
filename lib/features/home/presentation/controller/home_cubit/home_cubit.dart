import 'package:booky/core/models/book_model.dart';
import 'package:booky/features/home/data/repos/home_repo_imp.dart';
import 'package:booky/features/home/presentation/controller/home_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  List<BookModel> books = [];
  List<BookModel> relatedBooks = [];
  Future<void> fetchNewestBooks() async {
    print('test');
    books = await HomeRepoImp().fetchNewestBooks();
    emit(HomeSuccessState(books));
    print('from cubit ${books[0].volumeInfo!.title}');
  }

  Future<void> fetchBooksByCategory({required String categoryTitle}) async {
    print('test  Programming');
    books =
        await HomeRepoImp().fetchBooksByCategory(categoryTitle: categoryTitle);
    emit(HomeSuccessState(books));
    print('from cubit ${books[0].volumeInfo!.title}');
  }

  Future<void> fetchRelatedBooks({required String categoryTitle}) async {
    print('test  related ');
    relatedBooks =
        await HomeRepoImp().fetchRelatedBooks(categoryTitle: categoryTitle);
    emit(HomeSuccessState(relatedBooks));
    print('from cubit ${books[0].volumeInfo!.title}');
  }

  String listTitle = 'Programming';
  void changeNewestListTitle(int indexNumber) {
    if (indexNumber == 0) {
      listTitle = 'Programming';
    } else if (indexNumber == 1) {
      listTitle = 'Science';
    } else if (indexNumber == 2) {
      listTitle = 'Business';
    } else if (indexNumber == 3) {
      listTitle = 'History';
    } else {
      listTitle = 'Cooking';
    }
    emit(ChangeListTitleState());
  }

  
}
