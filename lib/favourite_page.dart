import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<Map<String, String>> favoriteCoffees = [
    {
      "name": "Caffe Latte",
      "description": "Smooth and creamy with steamed milk",
      "servings": "For 1 Person",
      "calories": "15 Calories",
      "image": "assets/Property 1=Coffee, Property 2=1.png",
    },
    {
      "name": "Caramel Macchiato",
      "description": "Rich espresso with caramel drizzle",
      "servings": "For 1 Person",
      "calories": "25 Calories",
      "image": "assets/Property 1=Coffee, Property 2=2.png",
    },
    {
      "name": "Espresso",
      "description": "Strong and bold, a pure espresso shot",
      "servings": "For 1 Person",
      "calories": "10 Calories",
      "image": "assets/Property 1=Coffee, Property 2=2.png",
    },
    {
      "name": "Mocha",
      "description": "Espresso mixed with chocolate and milk",
      "servings": "For 1 Person",
      "calories": "200 Calories",
      "image": "assets/Property 1=Coffee, Property 2=4.png",
    },
    {
      "name": "Cappuccino",
      "description": "Classic with steamed milk and foam",
      "servings": "For 1 Person",
      "calories": "180 Calories",
      "image": "assets/Property 1=Coffee, Property 2=5.png",
    },
  ];

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
        title: Text(
          'My Favorites',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteCoffees.length,
          itemBuilder: (context, index) {
            final coffee = favoriteCoffees[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          coffee["image"]!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 16,
                                );
                              }),
                            ),
                            SizedBox(height: 4),
                            Text(
                              coffee["name"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              coffee["description"]!,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person_outline, size: 16),
                                    SizedBox(width: 4),
                                    Text(coffee["servings"]!),
                                  ],
                                ),
                                SizedBox(width: 16),
                                Row(
                                  children: [
                                    Icon(Icons.flash_on, size: 16),
                                    SizedBox(width: 4),
                                    Text(coffee["calories"]!),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
