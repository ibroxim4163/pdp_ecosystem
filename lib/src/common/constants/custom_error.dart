class AdminRegisterError implements Exception {
  const AdminRegisterError(this.message);

  final String message;
}

class InternetConnectionError implements Exception{
  final String message;
  const InternetConnectionError(this.message);
}