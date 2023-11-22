extension StringExtensions on String {
  String get svg => 'assets/svg/$this.svg';
  String get png => 'assets/png/$this.png';
  String get pngTemp => 'assets/png/temp/$this.png';
  String get gif => 'assets/png/$this.gif';
  String get json => 'assets/png/$this.json';

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
