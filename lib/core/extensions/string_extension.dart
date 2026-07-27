extension StringExtension on String {
  String get initials {
    final words = trim().split(RegExp(r'\s+'));

    if (words.isEmpty || words.first.isEmpty) {
      return '';
    }

    if (words.length > 1) {
      return (words.first[0] + words.last[0]).toUpperCase();
    }

    return length >= 2 ? substring(0, 2).toUpperCase() : toUpperCase();
  }
}
