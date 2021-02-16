class Result<T> {
  final String errorMessage;
  final int code;
  final T value;
  final bool isSuccess;

  Result(this.errorMessage, this.code, this.value, this.isSuccess);

  static ok<T>(T item) {
    return Result(null, 200, item, true);
  }

  static error(String message, int code) {
    return Result(message, code, null, false);
  }
}
