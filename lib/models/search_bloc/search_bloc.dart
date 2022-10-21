import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:movieWorld/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc()
      : super(SearchState(
            isLoading: false,
            fetchedList: [],
            searchByDate: false,
            searchByTitle: false,
            error: false)) {
    on<SearchTrigger>((event, emit) {
      add(SearchByTitleTrigger(query: "The Godfather")); //default to populate
    });

    on<SearchByTitleTrigger>(transformer: (events, mapper) {
      return events
          .debounceTime(const Duration(milliseconds: 500))
          .asyncExpand(mapper);
    }, (event, emit) async {
      emit(SearchState(
          isLoading: true,
          fetchedList: [],
          searchByDate: false,
          searchByTitle: true,
          error: false,
       ));
      try {
        var fetchedList = await getMovies(event.query);
        emit(state.copyWith(isLoading: false, fetchedList: fetchedList,error: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false, fetchedList: [], error: true));
      }
      // print(state.fetchedList);
    });

    on<ClearFilterAndQuery>((event, emit) {
      emit(state.copyWith(
        isLoading: true,
        searchByDate: false,
      ));
    });
    on<SearchByYearTrigger>((event, emit) async {
      debugPrint("########################################3");
      debugPrint(event.dateTime.year.toString());
      emit(
          state.copyWith(isLoading: true, fetchedList: [], searchByDate: true,error: false));
      try {
        var fetchedList = await getMovies(event.query,event.dateTime);
        emit(state.copyWith(isLoading: false, fetchedList: fetchedList,error: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false, fetchedList: [], error: true));
      }
    });
  }
}

Future<List<Movie>> getMovies(String title, [DateTime? dateTime]) async {
  var url =
      Uri.parse("https://www.omdbapi.com/?s=$title&type=movie&apikey=ed61efbf");
  if (dateTime != null) {
    url = Uri.parse(
        "https://www.omdbapi.com/?s=$title&y=${dateTime.year}&type=movie&apikey=ed61efbf");
  }
  var response = await http.get(url);

  var responseData = jsonDecode(response.body);
  List<String> listOfId = [];
  responseData = responseData["Search"] as List<dynamic>;
  responseData = responseData.take(8);
  responseData.forEach((element) {
    listOfId.add(element["imdbID"]);
  });
  return getDetailedMoviesFromID(listOfId);
}

Future<List<Movie>> getDetailedMoviesFromID(List<String> id) async {
  List<Movie> mL = [];
  for (var element in id) {
    var url = Uri.parse("https://www.omdbapi.com/?i=$element&apikey=ed61efbf");
    var response = await http.get(url);
    var responseData = jsonDecode(response.body);

    // print("#############################");
    // print(responseData);
    // print("#############################");
    Movie obj = Movie(
      title: responseData["Title"],
      genre: responseData["Genre"],
      imgUrl: responseData["Poster"],
      rating: responseData["Rated"],
      plot: responseData["Plot"],
      director: responseData["Director"],
      actor: responseData["Actors"],
      runtime: responseData["Runtime"],
    );
    mL.add(obj);
    // print(mL.toString());
  }
  // print(mL);
  return mL;
}
