import 'package:course_app/common/values/constants.dart';
import 'package:course_app/global.dart';
import 'package:dio/dio.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }
  late Dio dio;
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstant.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 30),
        //receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions.headers = requestOptions.headers ?? {};
      Map<String, dynamic> authorization = getAuthHorizationHeader();
      if (authorization != null) {
        requestOptions.headers!.addAll(authorization);
      }
      var response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
      );
      print("my path data ${path.toString()}");
      print("my data data ${data.toString()}");
      print("my response data ${response.toString()}");
      return response.data;
    } on DioException catch (e) {
      print(e.toString());
    }
  }

  Map<String, dynamic> getAuthHorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer ${accessToken}';
    }
    return headers;
  }
}
