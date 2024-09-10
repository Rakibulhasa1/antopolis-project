import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String selectedSize = 'M'; // Default size selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Handle favorite button tap
            },
          ),
        ],
        title: Text(
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coffee Image
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/coffee_image.png'), // Your coffee image asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Product Name and Rating
              Text(
                'Caffe Mocha',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Ice/Hot',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),

              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    '4.8',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '(230)',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Icon(Icons.local_shipping, color: Colors.brown),
                  SizedBox(width: 8),
                  Icon(Icons.coffee, color: Colors.brown),
                  SizedBox(width: 8),
                  Icon(Icons.coffee, color: Colors.brown),
                ],
              ),

              SizedBox(height: 16),
              Divider(),

              // Description Section
              Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'A cappuccino is an approximately 150 ml (5 oz) beverage, '
                    'with 25 ml of espresso coffee and 85 ml of fresh milk the fo...',
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {
                  // Handle read more
                },
                child: Text(
                  'Read More',
                  style: TextStyle(color: Colors.brown),
                ),
              ),

              SizedBox(height: 16),
              Divider(),

              // Size Section
              Text(
                'Size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['S', 'M', 'L'].map((size) {
                  return ChoiceChip(
                    label: Text(size),
                    selected: selectedSize == size,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    selectedColor: Colors.brown.withOpacity(0.2),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: selectedSize == size ? Colors.brown : Colors.black,
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 16),

              // Price and Buy Now Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$4.53',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      primary: Colors.brown, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Handle buy now
                    },
                    child: Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
