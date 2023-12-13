import 'package:booky/features/search/presentation/views/widgets/search_field.dart';
import 'package:booky/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  FontAwesomeIcons.arrowLeft,
                ),
              ),
              const Expanded(
                child: SearchFormField(),
              ),
            ],
          ),
          const Expanded(
            child: SearchedBookListView(),
          ),
        ],
      ),
    );
  }
}
