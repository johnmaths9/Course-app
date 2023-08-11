import 'package:course_app/common/entities/course.dart';
import 'package:course_app/common/utils/http_util.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    return CourseListResponseEntity.fromJson(response);
  }
}
