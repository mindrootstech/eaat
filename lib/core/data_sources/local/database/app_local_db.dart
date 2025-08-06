import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:eaat/core/data_sources/local/tables/preferences_table.dart';
import 'package:eaat/features/onboarding/view/utils/prefs_constants.dart';
import 'package:path_provider/path_provider.dart';

part 'app_local_db.g.dart';

@DriftDatabase(tables: [PreferencesTable])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
