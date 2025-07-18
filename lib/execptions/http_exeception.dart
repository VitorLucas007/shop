class HttpExeception implements Exception{
  final String msg;
  final int statusCode;

  HttpExeception({
    required this.msg,
    required this.statusCode,
  });

  @override
    String toString() {
      return msg;
    }
}