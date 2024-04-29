

import 'package:Book_Shelf/homepage.dart';
import 'package:Book_Shelf/login.dart';
import 'package:flutter/material.dart';
import 'package:Book_Shelf/counterwidget.dart';
import 'package:Book_Shelf/orderconfirmation.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Checkout"),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shopping Bag",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildBookItem("The startup", "assets/images/1.jpg", "12.99"),
                  _buildBookItem("Zero To One", "assets/images/2.jpg", "9.99"),
                  _buildBookItem("Data stucture", "assets/images/3.jpg", "15.99"),
                  _buildBookItem("Lean Analytics", "assets/images/4.jpg", "8.99"),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  _buildSubtotal(),
                  const SizedBox(height: 10),
                  _buildShipping(),
                  const SizedBox(height: 10),
                  _buildTotal(),
                  const SizedBox(height: 10),
                  _buildDiscountCode(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /*ElevatedButton(
                        onPressed: () {
                          // Add functionality for continue shopping button
                        },
                        child: const Text("Continue Shopping"),
                      ),*/
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookstoreHomePage()),
                          );
                        },child: const Text("Continue Shopping"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffb9999a), // Change button color to red
                        ),


                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OrderConfirmationPage()),
                          );
                        }, child: const Text(" Confirm & Checkout"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffb9999a), // Change button color to red
                        ),

                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookItem(String name, String imagePath, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$$price',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 20),
            CounterWidget(),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSubtotal() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Subtotal:"),
        Text("\$45.96"),
      ],
    );
  }

  Widget _buildShipping() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Shipping:"),
        Text("\$5.00"),
      ],
    );
  }

  Widget _buildTotal() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total:"),
        Text("\$50.96"),
      ],
    );
  }

  Widget _buildDiscountCode() {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: "Enter Discount Code",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            print("Discount code applied");
          },
          child: const Text("Apply"),
        ),
      ],
    );
  }
}