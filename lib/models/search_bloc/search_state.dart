part of 'search_bloc.dart';


class SearchState extends Equatable {
  final bool isLoading;
  List<Movie> fetchedList;
  final bool searchByTitle;
  final bool searchByDate;
  final bool error;

  SearchState(
      {required this.isLoading,
      required this.fetchedList,
      required this.searchByDate,
      required this.searchByTitle,
      required this.error});

  @override
  bool get stringify => true;

  SearchState copyWith(
      {bool? isLoading,
      List<Movie>? fetchedList,
      bool? searchByDate,
      bool? searchByTitle,
      bool? error,
      }) {
    return SearchState(
      searchByDate: searchByDate ?? this.searchByDate,
      searchByTitle: searchByTitle ?? this.searchByTitle,
      isLoading: isLoading ?? this.isLoading,
      fetchedList: fetchedList ?? this.fetchedList,
      error: error?? this.error,
    );
  }

  @override
  List<Object> get props =>
      [isLoading, fetchedList, searchByDate, searchByTitle];
}
