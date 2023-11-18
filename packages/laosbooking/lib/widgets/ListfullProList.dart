import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/ListfullPro.dart';

class ListfullProList extends StatefulWidget {
  const ListfullProList({super.key, this.onSelect});
  final void Function(ListfullPro)? onSelect;
  @override
  State<ListfullProList> createState() => _ListfullProListState();
}

class _ListfullProListState extends State<ListfullProList> {
  bool loading = true;
  String type = 'ທັງໝົດ';
  List<ListfullPro> list = [];
  List<ListfullPro> showList = [];
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

  Future<void> loadData() async {
    final result = await _lao_gov.get("listfull_pro/1");
    if (result.statusCode == 200) {
      final histories = result.data;
      final List<ListfullPro> mappedHistories = [];
      histories.forEach((usr) {
        mappedHistories.add(ListfullPro.fromJson(usr));
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
        : Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      DropdownButton(
                          value: type,
                          items: ['ທັງໝົດ', 'ເຕັມແລ້ວ.', 'ຍັງວ່າງ.']
                              .map((el) =>
                                  DropdownMenuItem(value: el, child: Text(el)))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                type = value;
                                if (type != 'ປະເພດ') {
                                  showList = list
                                      .where(
                                          (element) => element.remark == value)
                                      .toList();
                                } else {
                                  showList = list;
                                }
                              });
                            }
                          })
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                      itemCount: showList.length,
                      itemBuilder: (builder, index) {
                        return InkWell(
                          onTap: () {
                            if (widget.onSelect != null) {
                              widget.onSelect!(showList[index]);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(color: Colors.lightBlue),
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(showList[index].queue_date)),
                                Text(showList[index].remark)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
  }
}
