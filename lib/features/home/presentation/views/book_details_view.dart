import 'package:booky/core/manager/styles.dart';
import 'package:booky/core/models/book_model.dart';
import 'package:booky/features/home/presentation/controller/related_books_cubit/related_books_cubit.dart';
import 'package:booky/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/details_app_bar.dart';
import 'widgets/details_image.dart';
import 'widgets/preview_button.dart';
import 'widgets/related_books_list_view.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<RelatedBooksCubit>(context).fetchRelatedBooks(
        categoryTitle:
            widget.bookModel.volumeInfo?.categories?[0] ?? 'No Title');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DetailsAppBar(),
            Center(
              child: DetailsImage(
                bookModel: widget.bookModel,
              ),
            ),
            BookMainInfo(
              bookModel: widget.bookModel,
            ),
            PreviewButton(bookModel: widget.bookModel),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'you can also like ',
                  style: textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const RelatedBooksListView(),
          ],
        ),
      ),
    );
  }
}

class BookMainInfo extends StatelessWidget {
  const BookMainInfo({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            bookModel.volumeInfo?.title ?? 'null',
            style: textStyle30,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 40,
                height: 20,
                child: Opacity(
                  opacity: 0.7,
                  child: Text(
                    bookModel.volumeInfo?.authors?[index] ?? 'null',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),

          const SizedBox(
            height: 15,
          ),
          BookRating(bookModel: bookModel),
          const SizedBox(
            height: 30,
          ),
          //  BookRating(),
        ],
      ),
    );
  }
}
