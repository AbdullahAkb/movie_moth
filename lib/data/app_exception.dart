// ignore_for_file: prefer_typing_uninitialized_variables

class AppExceptions implements Exception {
  final message;
  final prefix;

  AppExceptions([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super("", 'No Internet');
}

class RequestTimeout extends AppExceptions {
  RequestTimeout([String? message]) : super(message, 'Request Time Out');
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message]) : super(message, 'Internal Server Error');
}

class InvalidUrl extends AppExceptions {
  InvalidUrl([String? message]) : super(message, 'Invalid URL');
}

class FetchException extends AppExceptions {
  FetchException([String? message]) : super(message, 'Error while calling api');
}