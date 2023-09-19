abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure(String message) : super(message);
}
