abstract class HomeRepo {
  fetchNewestBooks();
  fetchBooksByCategory({required String categoryTitle});
  fetchScienceBooks();
  fetchBusinessBooks();
  fetchCookBooks();
  fetchRelatedBooks();
}
