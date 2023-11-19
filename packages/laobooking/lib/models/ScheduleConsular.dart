class ScheduleConsular {
  ScheduleConsular(
      {required this.unit_id,
      required this.range_id,
      required this.queue_date,
      required this.queue_date_f,
      required this.remark,
      required this.total});
  int unit_id;
  int range_id;
  String queue_date;
  String total;
  String remark;
  String queue_date_f;

  factory ScheduleConsular.fromJson(Map<String, dynamic> json) =>
      ScheduleConsular(
          unit_id: json['unit_id'],
          range_id: json['range_id'],
          queue_date: json['queue_date'],
          queue_date_f: json['queue_date_f'],
          remark: json['remark'],
          total: json['total']);
}
