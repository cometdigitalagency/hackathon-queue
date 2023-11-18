import 'package:flutter/material.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key, required this.formId});
  final int formId;
  @override
  State createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  int _currentStep = 0;
  String? gender;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  final items = ['male', 'female', 'other'];
  Future<void> showBirthDayPicker() async {
    final birthday = _birthdayController.text;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: birthday != null ? DateTime.tryParse(birthday!) : null,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.tryParse(birthday!)) {
      setState(() {
        _birthdayController.text = picked.toIso8601String().split('T')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("ແບບຟອມສະໝັກ"),
        leading: IconButton(
          onPressed: () {
            // context.goBack()
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              // Perform the final action, e.g., submit the form
              // You can access the form data using the controllers
              print('Name: ${_nameController.text}');
              print('Email: ${_emailController.text}');
              print('Password: ${_passwordController.text}');
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
                    controller: _nameController,
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
                      decoration: InputDecoration(prefixIcon: Icon(Icons.male)),
                      items: ['male', 'female', 'other']
                          .map((el) => DropdownMenuItem(
                                value: el,
                                child: Text(el),
                              ))
                          .toList(),
                      onChanged: (value) {
                        print('test');
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'ອີເມວ',
                      hintText: "example@gmail.com",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
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
              title: 'ຈອງບັດນັດກົດບັດຄິວອອນລາຍ',
              index: 1,
              content: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
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
        style: TextStyle(fontSize: 12),
      ),
      content: content,
      isActive: _currentStep == index,
    );
  }
}
