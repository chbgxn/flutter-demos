import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient():_dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
    }
  )){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onResponse: (response, handler) => handler.next(response),
      onError: (DioException error, handler) => handler.next(error),
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async{
    try{
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch(e){
      throw _handleError(e);
    }
  }

  Future<Response> post(String path, {dynamic data}) async{
    try{
      return await _dio.post(path, data: data);
    } on DioException catch(e){
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e){
    switch(e.type){
      case DioExceptionType.connectionError:
        return Exception('连接超时');
      case DioExceptionType.receiveTimeout:
        return Exception('响应超时');
      case DioExceptionType.badResponse:
        return Exception('请求失败');
      default:
        return Exception('网络错误');
    }
  }
}