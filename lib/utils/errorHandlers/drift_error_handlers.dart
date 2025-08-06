import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:eaat/core/errors/failures.dart';

Future<Either<Failure, T>> executeWithDriftHandling<T>(
  Future<T> Function() operation,
) async {
  try {
    return Right(await operation());
  } on DriftWrappedException catch (e) {
    return Left(LocalStorageFailure(e.message));
  }
}
