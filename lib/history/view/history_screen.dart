import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton_2023/history/providers/change_notifier.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryScreen();
}

class _HistoryScreen extends ConsumerState<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(historyCNProvider).loadHistories();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> pullRefresh() async {
      await ref.read(historyCNProvider).loadHistories();
    }

    final historyProvider = ref.watch(historyCNProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ປະຫວັດການຈອງຄິວ"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: pullRefresh,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: "ວັນທີ່ຈອງບັດຄິວ : ",
                        children: [TextSpan(text: '22/08/2022')],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text.rich(
                      TextSpan(
                        text: "ຊື່ ແລະ ນາມສະກຸນ : ",
                        children: [TextSpan(text: '22/08/2022')],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text.rich(
                      TextSpan(
                        text: "ສູນອອກໜັງສືຜ່ານແດນ :  ",
                        children: [TextSpan(text: '22/08/2022')],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text.rich(
                      TextSpan(
                        text: "ສະຖານະ :  ",
                        children: [
                          TextSpan(
                              text: 'ລໍຖ້າອະນຸມັດ',
                              style: TextStyle(color: Colors.orange))
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            print("hello world");
                          },
                          child: const Text("ເບິ່ງລາຍລະອຽດ")),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
