part of 'home_page_bloc.dart';

@immutable
class HomePageState {
  final int index;
  final List<CourseItem> courseItem;
  const HomePageState({
    this.courseItem = const <CourseItem>[],
    this.index = 0,
  });

  HomePageState copyWith({int? index, List<CourseItem>? courseItem}) {
    return HomePageState(
      index: index ?? this.index,
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
