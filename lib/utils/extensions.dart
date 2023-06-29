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

extension IntExtensions on int {
  String normalizeIndex() {
    if (toString().length == 1) {
      return '00$this';
    } else if (toString().length == 2) {
      return '0$this';
    }
    return toString();
  }
}
