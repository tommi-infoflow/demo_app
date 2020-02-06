class ResponseData {
  static const String DATA = 'data';
  static const String ERROR = 'error';

  final Map<String, dynamic> data;
  final Status error;

  ResponseData({this.data, this.error});
}

class Status {
  static const String CODE = 'code';
  static const String KEY = 'key';
  static const String MESSAGE = 'message';

  final int code;
  final String key;
  final String message;

  Status({this.code, this.key, this.message});

  Status.fromJson(Map<String, dynamic> json)
      : code = json[CODE],
        key = json[KEY],
        message = json[MESSAGE];

  Map<String, dynamic> toJson() => {
        CODE: code,
        KEY: key,
        MESSAGE: message,
      };
}
