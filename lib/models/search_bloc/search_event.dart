part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable{}

class SearchTrigger extends SearchEvent{
  @override
  List<Object> get props => [];
}

class SearchByTitleTrigger extends SearchEvent{
  String query;
  SearchByTitleTrigger({required this.query});

  @override
  List<Object> get props =>[query];
}

class SearchByYearTrigger extends SearchEvent{
  @override
  List<Object> get props =>[];
}