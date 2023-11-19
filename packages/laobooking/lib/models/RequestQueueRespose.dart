class RequestQueueResponse {
  RequestQueueResponse(
      {required this.code,
      required this.msg,
      required this.desc,
      required this.last_code});

  int code;
  String msg;
  String desc;
  String last_code;

  factory RequestQueueResponse.fromJson(Map<String, dynamic> json) =>
      RequestQueueResponse(
          code: json['code'],
          msg: json['msg'],
          desc: json['des'],
          last_code: json['last_code']);
}
