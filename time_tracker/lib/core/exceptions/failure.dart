class Failure implements Exception {
  final String message;
  final int statusCode;

  Failure({this.message = "Error", this.statusCode = 500});
  @override
  String toString() => message;
  String getStatusCode() => statusCode.toString();
}

class InternalException extends Failure {
  InternalException({dynamic message = "Internal Error"})
      : super(statusCode: 500, message: message);
}

class TimeOutException extends Failure {
  TimeOutException({dynamic message = "Internal Error"})
      : super(statusCode: 500, message: message);
}

class RequestInternalException extends Failure {
  RequestInternalException({dynamic message = "Request Internal Error"})
      : super(statusCode: 500, message: message);
}

class ConnectionException extends Failure {
  ConnectionException(
      {dynamic message = "Exception connecting to the internet"})
      : super(statusCode: 503, message: message);
}

class AuthorizationException extends Failure {
  AuthorizationException({dynamic message = "User not authorized"})
      : super(statusCode: 401, message: message);
}

class NotFoundException extends Failure {
  NotFoundException({dynamic message = "Endpoint not found"})
      : super(statusCode: 404, message: message);
}
