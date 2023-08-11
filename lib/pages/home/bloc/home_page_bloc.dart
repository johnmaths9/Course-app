import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/entities/course.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItem>(_homePageCourseItem);
  }

  FutureOr<void> _homePageDots(
      HomePageDots event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }

  FutureOr<void> _homePageCourseItem(
      HomePageCourseItem event, Emitter<HomePageState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
