extension StringExtension on String? {
  String pathParam(String param) => '$this/:$param';
  String get nullable => this ?? '-';
  String get nonNullable => this ?? '';
}
