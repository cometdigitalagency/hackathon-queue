import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HowToRegisterScreen extends StatelessWidget {
  const HowToRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/');
          },
        ),
        title: Text("ວິທີການສະໝັກ"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/image 18.png'),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text('1'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ກະລຸນາປ້ອນຂໍ້ມູນຂອງທ່ານແລ້ວລໍຖ້າການອະນຸມັດ.",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Text('2'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "ທ່ານຈະໄດ້ຮັບການແຈ້ງເຕືອນ ແລະ ຫຼັງຈາກນັ້ນໃຫ້ກະກຽມເອກະສານຂອງທ່ານໃຫ້ຄົບຖ້ວນ.",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/images/image 20.png'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset('assets/images/image 21.png'),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text('3'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ໃຫ້ເຂົ້າມາຢື່ນເອກະສານໃນການຂໍໜັງສືຜ່ານແດນຕາມມື້ທີ່ໄດ້ນັດໝາຍ.",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
