import 'package:drift/drift.dart';
import 'package:eaat/core/data_sources/local/database/app_local_db.dart';
import 'package:eaat/features/onboarding/view/utils/prefs_constants.dart';

class PreferencesEntity {
  final PreferenceType preferenceType;
  final List<PreferencesValueEntity> values;

  PreferencesEntity({required this.preferenceType, required this.values});

  PreferencesEntity copyWith({
    PreferenceType? preferenceType,
    List<PreferencesValueEntity>? values,
  }) {
    return PreferencesEntity(
      preferenceType: preferenceType ?? this.preferenceType,
      values: values ?? this.values,
    );
  }
}

class PreferencesValueEntity {
  final PreferenceType preferenceType;
  final bool isSelected;
  final String value;
  final String? id;

  PreferencesValueEntity({
    required this.preferenceType,
    required this.isSelected,
    required this.value,
    this.id,
  });

  PreferencesValueEntity copyWith({
    PreferenceType? preferenceType,
    bool? isSelected,
    String? value,
    String? id,
  }) {
    return PreferencesValueEntity(
      preferenceType: preferenceType ?? this.preferenceType,
      isSelected: isSelected ?? this.isSelected,
      value: value ?? this.value,
      id: id ?? this.id,
    );
  }

  factory PreferencesValueEntity.fromJson(Map<String, dynamic> json) {
    return PreferencesValueEntity(
      preferenceType: PreferenceType.values[json['preferenceType']],
      isSelected: json['isSelected'],
      value: json['value'],
      id: json['id'],
    );
  }

  PreferencesTableCompanion toCompanion() {
    return PreferencesTableCompanion(
      preferenceType: Value(preferenceType),
      isSelected: Value(isSelected),
      name: Value(value),
    );
  }

  @override
  String toString() {
    return 'PreferencesValueEntity(preferenceType: $preferenceType, isSelected: $isSelected, value: $value, id: $id)';
  }

  factory PreferencesValueEntity.fromPrefTable(PreferencesTableData data) {
    return PreferencesValueEntity(
      preferenceType: data.preferenceType,
      isSelected: data.isSelected,
      value: data.name,
    );
  }
}
