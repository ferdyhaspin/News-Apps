abstract class Failure {
  String? message;
}

class RequestException extends Failure {
  final message;

  RequestException(this.message);
}
