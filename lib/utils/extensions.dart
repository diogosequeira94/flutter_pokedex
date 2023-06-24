extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String formatTrivia() {
    return replaceAll("\n", " ");
  }

  String formatMove() {
    return replaceAll("-", " ");
  }
}
