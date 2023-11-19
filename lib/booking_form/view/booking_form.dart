import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laobooking/widgets/ScheduleConsular.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key, required this.formId});
  final int formId;
  @override
  State createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  int _currentStep = 0;
  String? gender = 'ຊາຍ';

  String? unit = 'ນະຄອນຫຼວງ';
  final TextEditingController requestQueueDate = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final items = ['male', 'female', 'other'];
  Future<void> showBirthDayPicker() async {
    final birthday = _birthdayController.text;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: birthday != null ? DateTime.tryParse(birthday!) : null,
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.tryParse(birthday!)) {
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
      body: SafeArea(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 1) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              context.go("/finish_booking");
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
                                  value: el,
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
                )),
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
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: requestQueueDate,
                    onTap: () => _showBottomSheet(context),
                    decoration: const InputDecoration(
                        labelText: 'ວັນທີ່ຈອງ', hintText: "YYYY-MM-DD"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
