extension StringExtension on String? {
  bool isNotNullOrEmpty() => this != null && this!.isNotEmpty;

  bool isZip5Code() =>
      isNotNullOrEmpty() ? RegExp(r'^\d{5}').hasMatch(this ?? "") : false;
}
