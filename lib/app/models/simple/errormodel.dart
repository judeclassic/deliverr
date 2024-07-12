class Err {
  String? message;
  Err({
    this.message,
  });

  factory Err.fromJSON(Map<String, dynamic> map) {
    return Err(
      message: map['message'],
    );
  }
}
