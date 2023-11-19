class RequestQueueResponse {
  RequestQueueResponse(
      {required this.code, required this.msg, required this.desc});

  int code;
  String msg;
  String desc;

  factory RequestQueueResponse.fromJson(Map<String, dynamic> json) =>
      RequestQueueResponse(
          code: json['code'],
          msg: json['msg'].runtimeType != String ? "Error" : json['msg'],
          desc: json['desc']);
}
