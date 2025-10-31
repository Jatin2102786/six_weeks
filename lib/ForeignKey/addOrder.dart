import 'package:flutter/material.dart';

import 'database.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({super.key});

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final TextEditingController _name = TextEditingController();
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Order")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _name,
            decoration: InputDecoration(
              hintText: "Enter Order Name",
              border: OutlineInputBorder(),
              labelText: "Order Name",
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed:
                () => {
                  // int response = db.insertRestaurant(_name.text, _address.text);
                  addOrder(),
                },
            child: Text("Add order"),
          ),
        ],
      ),
    );
  }

  Future<void> addOrder() async {
    if (_name.text.isNotEmpty) {
      int response = await db.insertOrder(_name.text,2 );
      List<Map<String, dynamic>> orders = await db.getOrder();

      if (response > 0) {
        print(orders);
      } else {
        print("Error");
      }
    }
  }
}
