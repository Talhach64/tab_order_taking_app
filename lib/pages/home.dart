import 'package:flutter/material.dart';
import 'package:tab_order_taking/components/app_button.dart';
import 'package:tab_order_taking/pages/dine_in.dart';
import 'package:tab_order_taking/pages/parcel.dart';

import '../components/cutom_list_tile.dart';
import '../main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text("Admin")),
            MyListTile(
              label: const Text('Home'),
              icon: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(height: 0),
            MyListTile(
              label: const Text('Log Out'),
              icon: const Icon(Icons.logout),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Order Taking App'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  // onTap: onTap,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              "Sync Menu",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: primaryColor,
                              ),
                            ))),
                  ),
                ),
                const SizedBox(height: 40.0),
                AppButtonWidget(label: "Dine In", onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  const DineIn()));}),
                const SizedBox(height: 10.0),
                AppButtonWidget(label: "Take Away", onTap: () {}),
                const SizedBox(height: 10.0),
                AppButtonWidget(label: "Parcel", onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  const Parcel()));}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
