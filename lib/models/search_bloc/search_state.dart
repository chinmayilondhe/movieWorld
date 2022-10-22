part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final bool isLoading;
  List<Movie> fetchedList;
  final bool searchByTitle;
  final bool searchByDate;

  SearchState(
      {required this.isLoading,
      required this.fetchedList,
      required this.searchByDate,
      required this.searchByTitle});

  @override
  bool get stringify => true;

  SearchState copyWith(
      {bool? isLoading,
      List<Movie>? fetchedList,
      bool? searchByDate,
      bool? searchByTitle}) {
    return SearchState(
      searchByDate: searchByDate ?? this.searchByDate,
      searchByTitle: searchByTitle ?? this.searchByTitle,
      isLoading: isLoading ?? this.isLoading,
      fetchedList: fetchedList ?? this.fetchedList,
    );
  }

  @override
  List<Object> get props =>
      [isLoading, fetchedList, searchByDate, searchByTitle];
}
