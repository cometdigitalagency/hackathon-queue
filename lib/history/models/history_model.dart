class History {
  History(
      {required this.account,
      required this.name,
      required this.surname,
      required this.dob,
      required this.sex,
      required this.email,
      required this.number,
      required this.center,
      required this.appdate,
      required this.queue,
      required this.subdate,
      required this.cancel,
      required this.proc,
      required this.validate,
      required this.verif});
  int account;
  String name;
  String surname;
  String dob;
  String sex;
  String email;
  int number;
  int center;
  String appdate;
  int queue;
  String subdate;
  int cancel;
  int proc;
  int validate;
  int verif;

  factory History.fromJson(Map<String, dynamic> json) => History(
        account: json['account'],
        name: json['name'],
        surname: json['surname'],
        dob: json['dob'],
        sex: json['sex'],
        email: json['email'],
        number: json['number'],
        center: json['center'],
        appdate: json['appdate'],
        queue: json['queue'],
        subdate: json['subdate'],
        cancel: json['cancel'],
        proc: json['proc'],
        validate: json['validate'],
        verif: json['verif'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account'] = account;
    data['name'] = name;
    data['surname'] = surname;
    data['dob'] = dob;
    data['sex'] = sex;
    data['email'] = email;
    data['number'] = number;
    data['center'] = center;
    data['appdate'] = appdate;
    data['queue'] = queue;
    data['subdate'] = subdate;
    data['cancel'] = cancel;
    data['proc'] = proc;
    data['validate'] = validate;
    data['verif'] = verif;
    return data;
  }
}
