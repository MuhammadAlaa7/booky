import 'package:dio/dio.dart';

class BooklyApi {
  static String baseUrl = 'https://www.googleapis.com/books/v1/';

  static Dio dio = Dio();

  static Future<dynamic> get({required endPoint}) async {
    try {
      Response response = await dio.get('$baseUrl$endPoint');

      return response.data['items'];
    } on DioException catch (ex) {
      throw Exception(ex);
    } on Exception catch (ex) {
      throw Exception(ex); 
    }
  }
}
