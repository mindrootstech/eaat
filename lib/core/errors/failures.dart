// lib/core/failures/local_storage_failure.dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure(super.message);
}
