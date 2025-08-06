import 'package:dartz/dartz.dart';
import 'package:eaat/core/constants/global.dart';
import 'package:eaat/core/data_sources/local/database/app_local_db.dart';
import 'package:eaat/core/errors/failures.dart';
import 'package:eaat/features/onboarding/model/entities/preferences_entity.dart';
import 'package:eaat/features/onboarding/view/utils/prefs_constants.dart';
import 'package:eaat/utils/errorHandlers/drift_error_handlers.dart';

class MyPreferencesRepository {
  Future<Either<Failure, Unit>> saveMyPreferences(
    List<PreferencesTableCompanion> preferences,
  ) async {
    return executeWithDriftHandling<Unit>(() async {
      await Global.dataBase.batch((batch) async {
        batch.insertAllOnConflictUpdate(
          Global.dataBase.preferencesTable,
          preferences,
        );
      });
      return unit;
    });
  }

  Future<Either<Failure, List<PreferencesValueEntity>>> getMyPreferences({
    required PreferenceType preferenceType,
  }) async {
    return executeWithDriftHandling<List<PreferencesValueEntity>>(() async {
      final query = Global.dataBase.select(Global.dataBase.preferencesTable)
        ..where((tbl) => tbl.preferenceType.equals(preferenceType.name));

      final data = await query.get();

      return data.map((e) => PreferencesValueEntity.fromPrefTable(e)).toList();
    });
  }
}
