
import 'dart:io';

import 'package:dio/dio.dart';

class GenericApiDioInterceptor extends Interceptor {
  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.error is SocketException) {
      throw NetworkConnectionErrorException(
        requestOptions: err.requestOptions,
      );
    }
    final statusCode = err.response?.statusCode ?? -1;

    switch (statusCode) {
      case 400:
        return handler.reject(
          EmailValidationFailedDioException(
            requestOptions: err.requestOptions,
          ),
        );
      case 401:
        return handler.reject(
          UnauthroizedDioException(requestOptions: err.requestOptions),
        );
      case 404:
        return handler.reject(
          NotFoundDioException(requestOptions: err.requestOptions),
        );
      case 500:
        return handler.reject(
          InternalServerErrorException(requestOptions: err.requestOptions),
        );
    }
    return handler.next(err);
  }
    }


class EmailValidationFailedDioException extends DioException {
  EmailValidationFailedDioException({required super.requestOptions});
}
class InternalServerErrorException extends DioException {
  InternalServerErrorException({required super.requestOptions});
}
class NotFoundDioException extends DioException {
  NotFoundDioException({required super.requestOptions});
}
class UnauthroizedDioException extends DioException {
  UnauthroizedDioException({required super.requestOptions});
}class NetworkConnectionErrorException extends DioException {
  NetworkConnectionErrorException({required super.requestOptions});
}
