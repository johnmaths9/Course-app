part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  final int index;

  const HomePageDots(this.index) : super();
}

class HomePageCourseItem extends HomePageEvent {
  final List<CourseItem> courseItem;

  const HomePageCourseItem(this.courseItem);
}
