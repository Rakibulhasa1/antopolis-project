

import 'package:antopolis_project/product_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
          Container(
            color: Color(0xff2c2c2c),
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 40),
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
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle location change
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

                // Search bar
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
                        fillColor: Color(0xff2a2a2a),
                        contentPadding: EdgeInsets.only(left: 16.0, right: 56.0), // Adjust right padding to accommodate filter button
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Promo image
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Banner.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.brown,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.brown,
                  tabs: const [
                    Tab(text: 'All Coffee'),
                    Tab(text: 'Machiato'),
                    Tab(text: 'Latte'),
                    Tab(text: 'Americano'),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // All Coffee Tab Content
                      buildProductList(),
                      // Machiato Tab Content
                      buildProductList(),
                      // Latte Tab Content
                      buildProductList(),
                      // Americano Tab Content
                      buildProductList(),
                    ],
                  ),
                ),
              ],
            ),
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
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsPage()));
            },
            child: Container(
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
                      'Product Name $index',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '\$4.99',
                      style: TextStyle(fontSize: 16, color: Colors.brown),
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