import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieWorld/models/search_bloc/search_bloc.dart';
import 'package:movieWorld/widgets/movie_list_builder.dart';

class SearchPage extends StatelessWidget {
  static const String id = "search_page";

  SearchPage({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          // backgroundColor: Colors.white,
          title: TextField(
            onChanged: (query) {
              BlocProvider.of<SearchBloc>(context)
                  .add(SearchByTitleTrigger(query: query));
            },
            controller: _textEditingController,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: "Search", ),
          ),
        ),
        body: BlocConsumer<SearchBloc, SearchState>(
          listener: (context, state) {
            debugPrint("Search State emitted");
          },
          builder: (context, state) {
            if (state.isLoading) {
              return Container(

                  child: ( LinearProgressIndicator(color:Colors.tealAccent,)));
            } else {
              return MovieListViewBuilder(moviesItem: state.fetchedList);
            }
          },
        ),
      ),
    );
  }
}
