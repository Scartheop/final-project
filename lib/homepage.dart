import 'package:Book_Shelf/account.dart';
import 'package:Book_Shelf/account.dart';
import 'package:flutter/material.dart';
import 'package:Book_Shelf/profile.dart';
import 'package:Book_Shelf/search.dart';
import 'package:Book_Shelf/sell.dart';
import 'package:Book_Shelf/check.dart';
import 'package:Book_Shelf/checkout.dart';
import 'package:Book_Shelf/language.dart';
import 'package:Book_Shelf/reset.dart';
import 'package:Book_Shelf/signup.dart';
import 'package:Book_Shelf/welcomepage.dart';
import 'package:Book_Shelf/orderconfirmation.dart';

void main() {
  runApp(BookstoreApp());
}

class BookstoreApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Shelf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookstoreHomePage(),
    );
  }
}

class BookstoreHomePage extends StatefulWidget {

  @override
  State<BookstoreHomePage> createState() => _BookstoreHomePageState();
}

class _BookstoreHomePageState extends State<BookstoreHomePage> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('BookShelf'),
    ),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    /*Container(
    padding: EdgeInsets.all(25.0),*/
    const SizedBox(
    child: Image(
      fit: BoxFit.fill,
    image: AssetImage('assets/images/books.png'),
    ), // Replace 'assets/bookshelf_image.png' with your image path
    ),
    /*Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
    decoration: InputDecoration(
    hintText: 'Search',
    prefixIcon: Icon(Icons.search),
    ),
    onTap: () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
    return SearchScreen();
    },
    ));
    },
    ),
    ),*/
    SizedBox(height: 30.0),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    children: [
    CategoryButton(title: 'Fiction'),
    CategoryButton(title: 'Non-fiction'),
    CategoryButton(title: 'Sci-Fi'),
    CategoryButton(title: 'Horror'),
    CategoryButton(title: 'Romance'),
    CategoryButton(title: 'Tech'),
    // Add more categories as needed
    ],
    ),
    ),
    SizedBox(height: 20.0),
    Container(
    height: 400.0,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 10, // Replace 10 with the actual number of books
    itemBuilder: (context, index) {
    return BookItem(
    title: 'Book Title',
    author: 'Author Name',
    imagePath: 'assets/images/atomichabbits.png',
    ); // Create a BookItem widget to display book details
    },
    ),
    ),
    ],
    ),
    ),
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentIndex,



    items: [
    BottomNavigationBarItem(

    icon: Icon(Icons.home),
    label: 'Home',
    backgroundColor: Color(0xff601719),


    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
      backgroundColor: Color(0xff601719),

    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.add),
    label: 'Sell',
      backgroundColor: Color(0xff601719),



    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Cart',
      backgroundColor: Color(0xff601719),

    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.account_circle),
    label: 'Account',
    backgroundColor: Color(0xff601719))



    ],
    onTap: (index) {
    setState(() {

    _currentIndex = index;
    if (_currentIndex == 0) { // Index 2 corresponds to the "Sell" button
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookstoreHomePage()));}
    if (_currentIndex == 1) { // Index 2 corresponds to the "Sell" button
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SearchScreen ()));}
    if (_currentIndex == 2) { // Index 2 corresponds to the "Sell" button
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ToggleScreen ()));}
    if (_currentIndex == 3) { // Index 2 corresponds to the "Sell" button
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Checkout()));}
    if (_currentIndex == 4) { // Index 2 corresponds to the "Sell" button
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Account()));}

    } ) ;
    },
    ),
    );
    }
    }

    class CategoryButton extends StatelessWidget {
    final String title;

    const CategoryButton({required this.title});

    @override
    Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ElevatedButton(
    onPressed: () {
    // Navigate or filter books based on category
    },
    child: Text(title),
    ),
    );
    }
    }

    class BookItem extends StatelessWidget {
    final String title;
    final String author;
    final String imagePath;

    const BookItem({
    required this.title,
    required this.author,
    required this.imagePath,
    });

    @override
    Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    width: 120.0,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Image.asset(imagePath), // Replace 'assets/book_cover.png' with your book cover image path
    SizedBox(height: 8.0),
    Text(
    title,
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
    Text(author),
    ],
    ),
    );
    }
    }