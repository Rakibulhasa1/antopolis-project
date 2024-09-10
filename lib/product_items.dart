import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  // Sample data for products (name and price)
  final List<Map<String, String>> products = [
    {'name': 'Americano', 'price': '4.99'},
    {'name': 'Latte', 'price': '5.49'},
    {'name': 'Cappuccino', 'price': '5.99'},
    {'name': 'Espresso', 'price': '3.99'},
    {'name': 'Mocha', 'price': '6.49'},
    {'name': 'Macchiato', 'price': '5.99'},
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items horizontally
        crossAxisSpacing: 8, // Space between items horizontally
        mainAxisSpacing: 8, // Space between items vertically
        childAspectRatio: 0.75, // Adjust as needed
      ),
      itemCount: products.length, // Number of products
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.brown[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/Image & Rating.png', // Replace with your product image
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  products[index]['name']!, // Dynamic product name
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${products[index]['price']}', // Dynamic product price
                      style: TextStyle(fontSize: 16, color: Colors.brown),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle add to cart functionality
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.brown, // You can change the color as needed
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
