import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

enum HttpMethod { get, put, delete, post }

void setupMockDioClientResponse({
  required Dio client,
  required HttpMethod method,
  required int statusCode,
  Object? requestData,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? responseJson,
}) {
  final dioResponse = Response(
    statusCode: statusCode,
    data: responseJson,
    requestOptions: RequestOptions(
      contentType: Headers.jsonContentType,
    ),
  );

  if (statusCode >= 200 && statusCode <= 202) {
    switch (method) {
      case HttpMethod.get:
        when(() => client.get(
              any(),
              options: any(named: 'options'),
              data: requestData ?? any(named: 'data'),
              queryParameters: queryParameters ?? any(named: 'queryParameters'),
            )).thenAnswer((_) async => dioResponse);
        return;
      case HttpMethod.post:
        when(() => client.post(
              any(),
              options: any(named: 'options'),
              data: requestData ?? any(named: 'data'),
              queryParameters: queryParameters ?? any(named: 'queryParameters'),
            )).thenAnswer((_) async => dioResponse);
      case HttpMethod.put:
        when(() => client.put(
              any(),
              options: any(named: 'options'),
              data: requestData ?? any(named: 'data'),
              queryParameters: queryParameters ?? any(named: 'queryParameters'),
            )).thenAnswer((_) async => dioResponse);
      case HttpMethod.delete:
        when(() => client.delete(
              any(),
              options: any(named: 'options'),
              data: requestData ?? any(named: 'data'),
              queryParameters: queryParameters ?? any(named: 'queryParameters'),
            )).thenAnswer((_) async => dioResponse);
    }
  } else {
    DioException dioException = DioException.badResponse(
      statusCode: statusCode,
      requestOptions: RequestOptions(
        contentType: Headers.jsonContentType,
      ),
      response: Response(
        requestOptions: RequestOptions(
          contentType: Headers.jsonContentType,
        ),
        statusCode: statusCode,
      ),
    );

    switch (method) {
      case HttpMethod.get:
        when(() => client.get(
              any(),
              options: any(named: 'options'),
              data: requestData ?? any(named: 'data'),
              queryParameters: queryParameters ?? any(named: 'queryParameters'),
            )).thenThrow(dioException);
        return;
      case HttpMethod.post:
        when(() => client.post(
              any(),
              options: any(named: 'options'),
              data: requestData ?? any(named: 'data'),
              queryParameters: queryParameters ?? any(named: 'queryParameters'),
            )).thenThrow(dioException);
      case HttpMethod.put:
        when(() => client.put(
              any(),
              options: any(named: 'options'),
              data: requestData ?? any(named: 'data'),
              queryParameters: queryParameters ?? any(named: 'queryParameters'),
            )).thenThrow(dioException);
      case HttpMethod.delete:
        when(() => client.delete(
              any(),
              options: any(named: 'options'),
              data: requestData ?? any(named: 'data'),
              queryParameters: queryParameters ?? any(named: 'queryParameters'),
            )).thenThrow(dioException);
    }
  }
}
