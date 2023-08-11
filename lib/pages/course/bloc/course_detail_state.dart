part of 'course_detail_bloc.dart';

@immutable
class CourseDetailState {
  final CourseItem? courseItem;
  const CourseDetailState({this.courseItem});

  CourseDetailState copyWith({CourseItem? courseItem}) {
    return CourseDetailState(courseItem: courseItem ?? this.courseItem);
  }
}
