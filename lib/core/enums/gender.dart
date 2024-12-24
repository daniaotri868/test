export 'order_status.dart';
import 'package:collection/collection.dart';

import '../../generated/l10n.dart';

enum Gender {
  none('None'),
  male('Male'),
  female('Female');

  final String value;
  const Gender(this.value);
}

Gender? genderFromString(String value) {
  return Gender.values.firstWhereOrNull((gender) => gender.value == value);
}
