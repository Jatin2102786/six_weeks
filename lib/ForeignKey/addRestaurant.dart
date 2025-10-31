import 'package:flutter/material.dart';
import 'package:six_weeks/ForeignKey/database.dart';

class AddRestaurantPage extends StatefulWidget {
  const AddRestaurantPage({super.key});

  @override
  State<AddRestaurantPage> createState() => _AddRestaurantPageState();
}

class _AddRestaurantPageState extends State<AddRestaurantPage> {

  DatabaseHelper db = DatabaseHelper();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Restaurant")),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _name,
              decoration: InputDecoration(
                hintText: "Enter Restaurant Name",
                border: OutlineInputBorder(),
                labelText: "Restaurant Name",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              minLines: 2,
              maxLines: 5,
              controller: _address,
              decoration: InputDecoration(
                hintText: "Enter Restaurant Address",
                border: OutlineInputBorder(),
                labelText: "Restaurant Address",
              ),
            ),

            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () => {
                  // int response = db.insertRestaurant(_name.text, _address.text);
                  addRestaurant()
                },
                child: Text("Add Restaurant")),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: () {

              db.deleteRestaurant(1);

            }, child: Text("Delete"))
          ],
        ),
      ),
    );
  }


  Future<void> addRestaurant() async{

    if(_name.text.isNotEmpty && _address.text.isNotEmpty) {
      int response = await db.insertRestaurant(_name.text,_address.text);

      if(response > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Restaurant Added!"))
        );

        List<Map<String, dynamic>> restaurants = await db.getRestaurant();
        print(restaurants);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Something went wrong!"))
        );
        print("Something went wrong");
      }

    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all the fields!"))
      );
    }

  }
}
