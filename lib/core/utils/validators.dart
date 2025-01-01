String? isNotEmpty(String? value) {
  return value == null || value.isEmpty ? 'This field cannot be empty' : null;
}

String? isValidDescription(String? value) {
  return value == null || value.isEmpty ? 'Description cannot be empty' : null;
}

String? isValidPriority(int? value) {
  return value == null ? 'Please select a priority' : null;
}
