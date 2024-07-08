import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/controller/expense_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ExpenseController controller = Get.put(ExpenseController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Item Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
                  double price = double.parse(priceController.text);
                  controller.addItem(nameController.text, price);
                  nameController.clear();
                  priceController.clear();
                }
              },
              child: const Text('Add Item'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: Text('₹${item.price.toStringAsFixed(2)}'),
                    );
                  },
                );
              }),
            ),
            Obx(() {
              return Text(
                'Total: ₹${controller.total.value.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              );
            }),
          ],
        ),
      ),
    );
  }
}
