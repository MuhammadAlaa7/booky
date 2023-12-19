import 'package:booky/core/models/book_model.dart';
import 'package:booky/features/home/data/repos/home_repo_imp.dart';
import 'package:booky/features/home/presentation/controller/home_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  List<BookModel> books = [];
  Future<void> fetchNewestBooks() async {
    print('test');
    books = await HomeRepoImp().fetchNewestBooks();
    emit(HomeSuccessState(books));
    print('from cubit ${books[0].volumeInfo!.title}');
  }
}
