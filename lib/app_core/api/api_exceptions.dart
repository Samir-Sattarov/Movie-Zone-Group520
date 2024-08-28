class UnauthorisedException implements Exception {}

class ExceptionWithMessage implements Exception {
  final String message;
  const ExceptionWithMessage(this.message);

  @override
  String toString() {
    return message;
  }
}
