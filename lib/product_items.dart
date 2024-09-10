import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Americano', 'price': '4.99'},
    {'name': 'Latte', 'price': '5.49'},
    {'name': 'Cappuccino', 'price': '5.99'},
    {'name': 'Espresso', 'price': '3.99'},
    {'name': 'Mocha', 'price': '6.49'},
    {'name': 'Macchiato', 'price': '5.99'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
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
                  'assets/Image & Rating.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  products[index]['name']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${products[index]['price']}',
                      style: TextStyle(fontSize: 16, color: Colors.brown),
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.brown,
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
