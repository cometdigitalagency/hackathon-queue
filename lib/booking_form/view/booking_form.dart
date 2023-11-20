import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laobooking/api/lao_gov_passport_api.dart';
import 'package:laobooking/widgets/ScheduleConsular.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key, required this.formId});
  final int formId;
  @override
  State createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  int _currentStep = 0;
  String? gender = 'M';
  bool loading = false;
  String? unit = 'ນະຄອນຫຼວງ';
  final TextEditingController requestQueueDate = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  Future<void> showBirthDayPicker() async {
    final birthday = _birthdayController.text;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.tryParse(birthday)) {
      setState(() {
        _birthdayController.text = picked.toIso8601String().split('T')[0];
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ScheduleConsularList(onSelect: (value) {
          Navigator.pop(context);
          setState(() {
            requestQueueDate.text = value.queue_date;
          });
        });
      },
    );
  }

  Future<void> submitForm() async {
    final api = ConsularLaoApi();
    final firstName = _nameController.text;
    final lastName = _surnameController.text;
    final queueDate = requestQueueDate.text;
    final sex = gender!;
    final tel = _phoneController.text;
    final birthday = _birthdayController.text;
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        queueDate.isEmpty ||
        tel.isEmpty ||
        birthday.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please input all field'),
          duration: const Duration(
              seconds: 3), // Duration for which the SnackBar will be visible
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Perform any action when the "Close" button is pressed
              ScaffoldMessenger.of(context)
                  .hideCurrentSnackBar(); // Close the SnackBar
            },
          ),
        ),
      );
      return;
    }
    setState(() {
      loading = true;
    });
    final birthday0 = birthday.split('-');
    final birthdayInDatetime = DateTime(int.parse(birthday0[0]),
        int.parse(birthday0[1]), int.parse(birthday0[2]));
    final age = calculateAge(birthdayInDatetime);
    final result = await api.requestQueueNo(
        firstName, lastName, queueDate, sex, tel, birthday, age);
    if (result.msg != 'Error') {
      context.go('/finish_booking');
    } else {
      context.go('/false_booking/${result.desc}');
    }
    setState(() {
      loading = false;
    });
  }

  int calculateAge(DateTime birthday) {
    DateTime now = DateTime.now();
    int age = now.year - birthday.year;

    if (now.month < birthday.month ||
        (now.month == birthday.month && now.day < birthday.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("ແບບຟອມສະໝັກ"),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(children: [
        Positioned(
            child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 1) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              submitForm();
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: [
            _buildStep(
              title: 'ປ້ອນຂໍ້ມູນສ່ວນຕົວ',
              index: 0,
              content: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'ຊື່ (ພາສາລາວ)',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _surnameController,
                    decoration: const InputDecoration(
                      labelText: 'ນາມສະກຸນ (ພາສາລາວ)',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    onTap: showBirthDayPicker,
                    controller: _birthdayController,
                    decoration: const InputDecoration(
                      labelText: 'ວັນ ເດືອນ ປີເກີດ',
                      hintText: "MM/DD/YYYY",
                      prefixIcon: Icon(Icons.calendar_month),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                      value: gender,
                      decoration:
                          const InputDecoration(prefixIcon: Icon(Icons.male)),
                      items: ['ຊາຍ', 'ຍິງ']
                          .map((el) => DropdownMenuItem(
                                value: el == 'ຊາຍ' ? 'M' : 'F',
                                child: Text(el),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'ອີເມວ',
                      hintText: "example@gmail.com",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'ເບີໂທ',
                      hintText: "20 XXXX XXXX",
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ],
              ),
            ),
            _buildStep(
              title: 'ຈອງບັດນັດກົດບັດຄິວ',
              index: 1,
              content: Column(
                children: [
                  DropdownButtonFormField(
                      value: unit,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.home_work),
                          label: Text("ສູນອອກໜັງສືຜ່ານແດນ")),
                      items: ['ນະຄອນຫຼວງ']
                          .map((el) => DropdownMenuItem(
                                value: el,
                                child: Text(el),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          unit = value;
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: requestQueueDate,
                    onTap: () => _showBottomSheet(context),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        labelText: 'ວັນທີ່ຈອງ',
                        hintText: "YYYY-MM-DD"),
                  ),
                ],
              ),
            ),
          ],
        )),
        loading
            ? Positioned(
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : const SizedBox(),
      ]),
    );
  }

  Step _buildStep(
      {required String title, required Widget content, required int index}) {
    return Step(
      title: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
      content: content,
      isActive: _currentStep == index,
    );
  }
}
