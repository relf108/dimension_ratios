class OverMaxException implements Exception {
  String message;
  OverMaxException({this.message = 'The percent passed in is over 100%'});
}
