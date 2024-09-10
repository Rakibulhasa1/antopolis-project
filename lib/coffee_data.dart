import 'dart:convert';

class Coffee {
  final int id;
  final String name;
  final String description;
  final String image;
  final String price;
  final String calories;

  Coffee({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.calories,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      calories: json['calories'],
    );
  }
}

List<Coffee> parseCoffeeData(String jsonData) {
  final parsed = json.decode(jsonData).cast<Map<String, dynamic>>();
  return parsed.map<Coffee>((json) => Coffee.fromJson(json)).toList();
}

String coffeeJson = '''
[
  {
    "id": 1,
    "name": "Caffe Latte",
    "description": "Smooth and creamy with steamed milk",
    "image": "assets/Property 1=Coffee, Property 2=1.png",
    "price": "\$4.50",
    "calories": "150 Calories"
  },
  {
    "id": 2,
    "name": "Caramel Macchiato",
    "description": "Rich espresso with caramel drizzle",
    "image": "assets/Property 1=Coffee, Property 2=2.png",
    "price": "\$5.00",
    "calories": "250 Calories"
  },
  {
    "id": 3,
    "name": "Espresso",
    "description": "Strong and bold, a pure espresso shot",
    "image": "assets/Property 1=Coffee, Property 2=3.png",
    "price": "\$2.50",
    "calories": "10 Calories"
  },
  {
    "id": 4,
    "name": "Mocha",
    "description": "Espresso mixed with chocolate and milk",
    "image": "assets/Property 1=Coffee, Property 2=4.png",
    "price": "\$4.00",
    "calories": "200 Calories"
  },
  {
    "id": 5,
    "name": "Cappuccino",
    "description": "Classic with steamed milk and foam",
    "image": "assets/Property 1=Coffee, Property 2=5.png",
    "price": "\$4.20",
    "calories": "180 Calories"
  }

]
''';
