import 'package:flutter/material.dart';

class AdviceBookPassport extends StatelessWidget {
  const AdviceBookPassport({super.key, required this.acceptRead});
  final VoidCallback acceptRead;

  final String multilineText = '''
1. ຂຽນຄໍາຮອ້ງຂໍໜັງສືຜ່ານແດນຕາມໃບຄໍາຮ້ອງ ເຊິ່ງສາມາດດາວໂລດໄດ້ຈາກເວັບໄຊຂອງກະຊວງການຕ່າງປະເທດ ຕາມທີ່ຢູ່ນີ້ http://www.mofa.gov.la/index.php/lo/ ຫຼື http://www.mofa.gov.la/index.php/lo/passport_application

2. ໃບຄໍາຮອ້ງຂໍໜັງສືຜ່ານແດນ ຕອ້ງຕິດຮູບສີ(ພື້ນສີຂາວ) ຂະໜາດ 4 x 6 ຊມ ພ້ອມທັງປະທັບການາຍບ້ານ;

3. ບຸກຄົນທີ່ມາເຮັດໜັງືຜ່ານແດນ ຕ້ອງໄດ້ມາຍື່ນເອກະສານດ້ວຍຕົນເອງ ເພື່ອຖ່າຍຮູບ (ແຕ່ງກາຍສຸພາບ ແລະ ບໍ່ໃຫ້ໃສ່ເສື້ອສີຂາວ) ແລະ ເກັບລາຍນິ້ວມື;

4. ກໍລະນີພໍ່ ແລະ ແມ່ ຂອງບຸກຄົນທີ່ມາເຮັດໜັງສືຜ່່ານແດນບໍ່ໄດ້ຢູ່ໃນສໍາມະໂນຄົວເຫຼັ້ມດຽວກັນ ຕ້ອງຖືໜັງສືຢັ້ງຢືນການເກີດ ຈາກຫ້ອງການພາຍໃນຂອງເມືອງ ແລະ ໃບແຕ່ງດອງຂອງພໍ່ ແລະ ແມ່ ສະບັບແທ້ມານໍາ ພ້ອມທັງສໍາເນົາຈໍານວນ 01 ຊຸດ ປະກອບໃສ່ໃບຄໍາຮອ້ງ;

5. ສໍາລັບຜູ້ທີ່ມີອາຍຸຕໍ່າກວ່າ 18 ປີຕ້ອງແມ່ນຜູ້ປົກຄອງພາມາ;

6. ບຸກຄົນທີ່ເຮັດໜັງສືຜ່ານແດນເສຍ ຕ້ອງມີໃບແຈ້ງເສຍຫາຍຈາກເຈົ້າໜ້າທີ່ ປກສ ຂັ້ນເມືອງ ຫຼື ແຂວງ ຫຼື ນະຄອນຫຼວງ;

7. ບຸກຄົນທີ່ມີໜັງສືຜ່ານແດນແລ້ວ ຖ້າຕ້ອງການປ່ຽນຊື່ ຫຼື ນາມສະກຸນ ຫຼື ຕື່ມນາມສະກຸນ ຕອ້ງຖືໃບອະນຸຍາດ ຈາກພະແນກ ພາຍໃນເມືອງ ສະບັບແທ້ພອ້ມທັງສໍາເນົາຈໍາ ນວນ 01 ຊຸດປະກອບໃສ່ ໃບ ຄໍາຮອ້ງ;

8. ບຸກຄົນທີ່ມີພໍ່ ຫຼື ແມ່ ເປັນຄົນຕ່າງປະເທດ ຕ້ອງຖືໃບແຕ່ງດອງສະບັບແທ້ຂອງ ພໍ່ແມ່ ມານໍາ ພອ້ມທັງສໍາເນົາຈໍາ ນວນ 01 ຊຸດ ປະກອບໃສ່ ໃບຄໍາຮອ້ງຂໍໜັງສືຜ່ານແດນ. ຖ້າແຕ່ງດອງຢູ່ຕ່າງປະເທດ ໃບແຕ່ງດອງດັ່ງກ່າວ ຕ້ອງຜ່ານການຢັ້ງຢືນຈາກ ສະຖານເອກອັກຄະລັດຖະທູດ ຫຼື ກົງສູນໃຫຍ່ ແຫ່ງ ສປປ ລາວ ປະຈໍາຢູ່ ຫຼື ຮັບຜິດຊອບປະເທດນັ້ນ;

9. ບຸກຄົນທີ່ມາຂໍປ່ຽນໜັງສືຜ່ານແດນ ກໍລະນີອາໄສຢູ່ຕ່າງປະເທດ ຕ້ອງມີໃບນໍາສົ່ງຂອງສະຖານທູດລາວ ປະຈໍາ ຢູ່ປະເທດທີ່ຕົນອາໄສຢູ່ ປະກອບໃສ່ຊຸດໃບຄໍາຮ້ອງຂໍ ປ່ຽນໜັງສືຜ່ານແດນ;

10. ບຸກຄົນທີ່ສະກົດຊື່ ແລະ ນາມສະກຸນ ພາສາຕ່າງປະເທດ ທີ່ຂັດກັບຫຼັກຂອງວິຊາການ (ສະກົດແບບພາສາຝຣັ່ງ ຕົວຢ່າງ: Mr. Seng ແຕ່ສະກົດ Mr. Saeng ຫຼື Mr. Phothisay ແຕ່ສະກົດ Mr. Bodhisay) ຕ້ອງຖືເອກະສານ ສະບັບແທ້ພ້ອມ ທັງສໍາເນົາຈໍານວນ 01 ຊຸດ ທີ່ທາງການເຄີຍອອກໃຫ້ເຊັ່ນ: ໃບປະກາດ ຫຼື ເອກະສານທາງການອື່ນໆ ມາຢັ້ງຢຶນຕໍ່ເຈົ້າໜ້າທີ່ກ່ຽວຂ້ອງຂອງກົມກົງສູນ;

11. ຄົນຕ່າງດ້າວທີ່ໄດ້ສັນຊາດລາວ ຕ້ອງຖືເອກະສານ ການໄດ້ຮັບສັນຊາດລາວທີ່ຖືກຕອ້ງຈາກພາກສ່ວນກ່ຽວຂອ້ງ ສະບັບແທ້ ພ້ອມສໍາເນົາຈໍານວນ 1 ຊຸດປະກອບໃສ່ໃບຄໍາຮອ້ງ;

12. ສໍາລັບພະສົງ, ສໍາມະເນນ ແລະ ແມ່ຂາວ ຕ້ອງມີໃບຢັ້ງຢືນຈາກອົງການພຸດທະສາສະໜາຂອງແຂວງ ຫຼື ກົມສາສະໜາຂອງ ສູນກາງແນວລາວສ້າງຊາດ, ຕອ້ງຖືປື້ມສຸດທິ ແລະ ສໍາມະໂນຄົວສົງ ສະບັບແທ້ພ້ອມທັງສໍາເນົາຈໍານວນ 1 ຊຸດ ປະກອບໃສ່ໃບຄໍາຮອ້ງຂໍໜັງສືຜ່ານແດນ.

13. ນອກຈາກເອກະສານທີ່ກ່າວມາຂ້າງເທິງນີ້ , ເຈົ້າໜ້າທີ່ອາດຈະຂໍເອກະສານອື່ນໆທີ່ກ່ຽວຂ້ອງເພີ່່ມເຕີມ ເພື່ອປະກອບໃສ່ ໃບຄໍາຮອ້ງຂໍໜັງສືຜ່ານແດນ ຕາມແຕ່ລະກໍລະນີ.
  ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 150),
              children: [
                // Your scrollable content goes here
                const Text(
                  'ຄຳແນະນຳການປະກອບຄຳຮ້ອງຂໍໜັງສືຜ່ານແດນ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  multilineText,
                  style: const TextStyle(fontSize: 16),
                )
                // Add more widgets as needed
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: acceptRead,
                  child: const Text('Accept'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
