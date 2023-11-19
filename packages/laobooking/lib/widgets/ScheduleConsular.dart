import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/ScheduleConsular.dart';

class ScheduleConsularList extends StatefulWidget {
  const ScheduleConsularList({super.key, required this.onSelect});
  final void Function(ScheduleConsular)? onSelect;
  @override
  State<ScheduleConsularList> createState() => _ScheduleConsularListState();
}

class _ScheduleConsularListState extends State<ScheduleConsularList> {
  bool loading = true;
  String type = 'ທັງໝົດ';
  List<ScheduleConsular> list = [];
  List<ScheduleConsular> showList = [];
  final TextEditingController _pickdateController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  final _lao_gov = Dio(BaseOptions(
    baseUrl: "https://consularlao.gov.la/api/",
    headers: {
      'Authorization':
          'Bearer anUrbLQdEVK7V/w3Mjkp28ZDJXgDH7SpKeqtKBjkqMnNJT4OQ?ukI8w7M5/HmxsONU78KEg4p=!5r0WOf=5/zBa9h/PTI42lb5JEhR855=LTAt!!AeJBFkmFtrpOwS7KhMuk!=B=8Rn=aqz6U59ZoPATYEKFkaZ-C/4ZRUXjUfb4DA0-69KsueEHkI/RW8mD2lLudpbe5JZpti=uQmQe5Nq2G6pP9//DX9hGm3yFpVMInuh-O50nbYdMej1miJTs',
      'Content-Type': 'application/json', // Adjust content type as needed
    },
  ));

  Future<void> showBirthDayPicker() async {
    final birthday = _pickdateController.text;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: birthday != null ? DateTime.tryParse(birthday!) : null,
      firstDate: DateTime(1980),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked != DateTime.tryParse(birthday!)) {
      setState(() {
        var pickdate = picked.toIso8601String().split('T')[0];
        _pickdateController.text = pickdate;
        type = 'ທັງໝົດ';
        showList = list.where((l) => l.queue_date == pickdate).toList();
      });
    }
  }

  Future<void> loadData() async {
    final result = await _lao_gov.get("listfull_pro/1");
    if (result.statusCode == 200) {
      final histories = result.data;
      final List<ScheduleConsular> mappedHistories = [];
      histories.forEach((usr) {
        mappedHistories.add(ScheduleConsular.fromJson(usr));
      });

      setState(() {
        loading = false;
        list = mappedHistories;
        showList = list;
      });
    } else {
      setState(() {
        loading = false;
        list = [];
      });
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _pickdateController,
                        readOnly: true,
                        onTap: showBirthDayPicker,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          hintText: "YYYY-MM-DD",
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _pickdateController.text = "";
                          setState(() {
                            showList = list;
                          });
                        },
                        icon: const Icon(Icons.close)),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: DropdownButton(
                            value: type,
                            items: ['ທັງໝົດ', 'ເຕັມແລ້ວ.', 'ຍັງວ່າງ.']
                                .map((el) => DropdownMenuItem(
                                    value: el, child: Text(el)))
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  type = value;
                                  if (type != 'ທັງໝົດ') {
                                    showList = list
                                        .where((element) =>
                                            element.remark == value)
                                        .toList();
                                  } else {
                                    showList = list;
                                  }
                                });
                              }
                            }),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                    itemCount: showList.length,
                    itemBuilder: (builder, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            if (widget.onSelect != null) {
                              widget.onSelect!(showList[index]);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(showList[index].queue_date)),
                                Text(showList[index].total),
                                const SizedBox(width: 20),
                                Text(showList[index].remark)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
  }
}
