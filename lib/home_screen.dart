

import 'package:antopolis_project/product_details.dart';
import 'package:flutter/material.dart';

import 'coffee_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Coffee> coffeeItems = parseCoffeeData(coffeeJson);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 260,
                color: Color(0xff2c2c2c),
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Location',
                          style: TextStyle(
                            color: Color(0xffa2a2a2),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),  const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {

                          },
                          child: const Row(
                            children: [
                              Text(
                                'Bilzen, Tanjungbalai',
                                style: TextStyle(color: Color(0xffd8d8d8), fontSize: 16),
                              ),
                              Icon(Icons.keyboard_arrow_down, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Coffee',
                            hintStyle: const TextStyle(color: Color(0xffd8d8d8)),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 12.0,right: 12),
                              child: Image.asset(
                                'assets/Icon.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                'assets/Filet.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: const Color(0xff2a2a2a),
                            contentPadding: const EdgeInsets.only(left: 16.0, right: 56.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                        Positioned(
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/Banner.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                          ),
                        ),

                  ],
                ),
              ),
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  indicator: BoxDecoration(
                    color: const Color(0xffc67c4e),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                  padding: const EdgeInsets.only(left: 0),
                  tabs: const [
                    Tab(text: 'All Coffee'),
                    Tab(text: 'Machiato'),
                    Tab(text: 'Latte'),
                    Tab(text: 'Americano'),
                  ],
                ),


                SizedBox(
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.only(left:16.0,right: 16),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        buildProductList(),
                        buildProductList(),
                        buildProductList(),
                        buildProductList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

        ],
      ),
    );
  }
  Widget buildProductList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: coffeeItems.length,
        itemBuilder: (context, index) {
          final coffee = coffeeItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(coffee: coffee),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          coffee.image,
                          width: double.infinity,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),topRight: Radius.circular(16)),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: Color(0xffc67c4e), size: 16),
                              SizedBox(width: 4),
                              Text(
                                '3.8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Text(
                      coffee.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          coffee.price,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Image.asset('assets/Icon(1).png', width: 35, height: 35),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}