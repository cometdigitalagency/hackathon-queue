import 'package:flutter/material.dart';
import 'package:laobooking/api/lao_gov_passport_api.dart';
import 'package:laobooking/models/FindQueueModel.dart';

class FindQueueWidget extends StatefulWidget {
  const FindQueueWidget({super.key, this.onSelect});
  final void Function(FindQueueModel)? onSelect;
  @override
  State<FindQueueWidget> createState() => _FindQueueWidgetState();
}

class _FindQueueWidgetState extends State<FindQueueWidget> {
  final api = ConsularLaoApi();
  List<FindQueueModel> list = [];
  List<FindQueueModel> showList = [];
  TextEditingController firstNameController =
      TextEditingController(text: "THEP-ANANH");
  TextEditingController lastNameController =
      TextEditingController(text: "VIRATHAVONE");

  Future<void> loadData() async {
    var firstName = firstNameController.value.text;
    var lastName = lastNameController.value.text;
    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      final result = await api.findQueue(firstName, lastName);
      setState(() {
        list = result;
        showList = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(label: Text("ຊື່")),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(label: Text("ນາມສະກຸນ")),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loadData();
                    },
                    child: Text("ຄົ້ນຫາ"),
                  ),
                ),
                ...showList.map((list) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        if (widget.onSelect != null) {
                          widget.onSelect!(list);
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
                            Text(list.fname),
                            const SizedBox(width: 20),
                            Expanded(child: Text(list.queueDate)),
                          ],
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
