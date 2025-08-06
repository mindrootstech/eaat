import 'package:drift/drift.dart';
import 'package:eaat/features/onboarding/view/utils/prefs_constants.dart';

class PreferencesTable extends Table {
  // Enum stored as text using Drift's built-in extension
  TextColumn get preferenceType => textEnum<PreferenceType>()();

  TextColumn get name => text()
      .named('name')
      .customConstraint('NOT NULL UNIQUE')(); // Fix for both issues

  BoolColumn get isSelected => boolean()();

  @override
  Set<Column> get primaryKey => {name};
}
