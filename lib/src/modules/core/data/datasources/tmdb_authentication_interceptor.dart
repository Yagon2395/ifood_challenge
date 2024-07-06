import 'package:dio/dio.dart';

class TMDBAuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZTJjZjQ1M2UyMTlkZWQyMDBmMDU2Y2EwODMxMDBlYyIsIm5iZiI6MTcyMDE5MjM2Ni41Nzc1MTQsInN1YiI6IjYxOTk1ZDllNjM1MzZhMDA0MzllODM0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FV683rLCYhlACjyL9ibQEt_mmQf3t5thbKfqJjcXyAE';
    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
}
