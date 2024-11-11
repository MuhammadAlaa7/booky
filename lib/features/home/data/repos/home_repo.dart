abstract class HomeRepo {
  fetchNewestBooks();
  fetchBooksByCategory({required String categoryTitle});

  fetchRelatedBooks({required String categoryTitle});
}
