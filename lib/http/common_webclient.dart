import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:iaidyou/http/intercerptors/logging_interceptor.dart';
 
final Client commonWebclient = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 10)
);

const String baseUrl = '';