import 'package:booky/core/manager/styles.dart';
import 'package:booky/core/models/book_model.dart';
import 'package:booky/core/utils/utils.dart';
import 'package:booky/features/home/presentation/controller/home_cubit/cubit.dart';
import 'package:booky/features/home/presentation/controller/home_cubit/states.dart';
import 'package:booky/features/home/presentation/controller/related_books_cubit/related_books_cubit.dart';
import 'package:booky/features/home/presentation/controller/related_books_cubit/related_books_state.dart';
import 'package:booky/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/details_app_bar.dart';

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
        categoryTitle: widget.bookModel.volumeInfo!.categories![0]);
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
            const PreviewButton(),
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
            const SimilarBooksListView(),
          ],
        ),
      ),
    );
  }
}

class DetailsImage extends StatelessWidget {
  const DetailsImage({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        bookModel.volumeInfo?.imageLinks?.thumbnail ?? nullImage,
        // cacheHeight: 300,
        //  cacheWidth: 220,
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.height * 0.2,

        fit: BoxFit.fill,
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
            itemCount: bookModel.volumeInfo?.authors?.length,
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
            height: 10,
          ),
          BookRating(bookModel: bookModel),
          //  BookRating(),
        ],
      ),
    );
  }
}

class PreviewButton extends StatelessWidget {
  const PreviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.white,
                // side: BorderSide(color: Colors.yellow, width: 5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Free',
                style: textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color(0xffEF8262),
                // side: BorderSide(color: Colors.yellow, width: 5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Preview',
                style: textStyle18.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedBooksCubit, RelatedBooksStates>(
      builder: (context, state) {
        var relatedBooks =
            BlocProvider.of<RelatedBooksCubit>(context).relatedBooks;
        return Padding(
          padding: const EdgeInsets.only(left: 30, top: 16),
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SimilarBookItem(
                  relatedBookModel: relatedBooks[index],
                );
              },
              itemCount: relatedBooks.length,
            ),
          ),
        );
      },
    );
  }
}

// this is the similar books
class SimilarBookItem extends StatelessWidget {
  const SimilarBookItem({
    super.key,
    required this.relatedBookModel,
  });
  final BookModel relatedBookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacement(
          '/$bookDetailsViewPath',
          extra: relatedBookModel,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 10,
        ),
        clipBehavior: Clip.antiAlias,
        //height: ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          relatedBookModel.volumeInfo?.imageLinks?.thumbnail ?? nullImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
