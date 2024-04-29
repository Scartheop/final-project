import 'package:flutter/material.dart';
import 'package:Book_Shelf/checkout.dart';

class BookPage extends StatelessWidget {
  final String bookName;
  final String author;
  final String imageURL;
  final double price;

  BookPage({
    required this.bookName,
    required this.author,
    required this.imageURL,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Book Image
            Image.network(
              imageURL,
              height: 300,
              fit: BoxFit.cover,
            ),
            // Book Name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                bookName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Author
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Author: $author',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Price: \$${price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            // Buy Button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Checkout();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Buy Now',
                style: TextStyle(
                    fontSize: 18,
                    color:Colors.white
                ),
              ),
              // Set the primary color directly
              // You can change the color to any other color you prefer
              // For example, Colors.green, Colors.blue, Colors.red, etc.
              // primary: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookPage(
      bookName: 'Book Name',
      author: 'Amr Ahmed',
      imageURL:
      'https://via.placeholder.com/300', // Replace with actual image URL
      price: 9.99,
    ),
  ));
}