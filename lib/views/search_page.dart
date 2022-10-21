import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieWorld/models/search_bloc/search_bloc.dart';
import 'package:movieWorld/widgets/movie_list_builder.dart';

class SearchPage extends StatelessWidget {
  static const String id = "search_page";

  SearchPage({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        // foregroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Select year"),
                        content: Container(
                          width: 300,
                          height: 300,
                          child: YearPicker(
                            firstDate: DateTime(DateTime.now().year - 100, 1),
                            lastDate: DateTime(DateTime.now().year + 100, 1),
                            selectedDate: _selectedDate,
                            onChanged: (DateTime datetime) {
                              _selectedDate = datetime;
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    });
                // print(_selectedDate.year);
                BlocProvider.of<SearchBloc>(context).add(SearchByYearTrigger(
                    query: _textEditingController.text,
                    dateTime: _selectedDate));
              },
              icon: const Icon(Icons.edit_calendar_sharp)),
          IconButton(
              onPressed: () {
                _textEditingController.clear();
                BlocProvider.of<SearchBloc>(context).add(ClearFilterAndQuery());
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      "Year queries and recents cleared",
                      style: TextStyle(color: Colors.black),
                    )));
              },
              icon: const Icon(Icons.dangerous_rounded))
        ],
        title: TextField(
          onChanged: (query) {
            BlocProvider.of<SearchBloc>(context)
                .add(SearchByTitleTrigger(query: query));
          },
          controller: _textEditingController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
          ),
        ),
      ),
      body: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          debugPrint("Search State emitted");
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
                child: (CircularProgressIndicator(
              color: Colors.tealAccent,
            )));
          } else if (state.error) {
            return const Center(
                child: Text(
                  style: TextStyle(color: Colors.white),
                    "Some error occurred, either selected year has no movie related to keyword, or try changing key words"));
          } else {
            return MovieListViewBuilder(moviesItem: state.fetchedList);
          }
        },
      ),
    );
  }
}
