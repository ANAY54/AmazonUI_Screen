import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Color selectedColor = const Color(0xFFF5F5DC);
  String selectedColorName = "Beige";
  int _currentIndex = 0;

  final Map<String, Color> colourOptions = {
    "Black": Colors.black,
    "Grey": Colors.grey,
    "Blue": Colors.blue,
    "Red": Colors.red,
    "Beige": Color(0xFFF5F5DC),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFFB3E5FC),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Headphone",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        actions: const [
          Icon(Icons.mic, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.qr_code_scanner, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 18),
                  Text("Deliver to Jinendra - Pune"),
                ],
              ),
            ),

            Center(
              child: Image.asset(
                'assets/headphone.png',
                height: 250,
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Boult Q Over Ear Bluetooth Headphones with 70H Playtime, 40mm Bass Drivers",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text("3k+ bought in last month"),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Select Colour - $selectedColorName",
                style: const TextStyle(fontSize: 16),
              ),
            ),

            Row(
              children: [
                const SizedBox(width: 12),
                ...colourOptions.entries.map(
                      (entry) => _colorCircle(entry.key, entry.value),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    "₹1999",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "M.R.P: ₹5999",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("(67% off)"),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text("Free delivery Sat, 8 Mar"),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text("7 Days Service Centre Replacement"),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _button("Add to Cart", Colors.yellow.shade700),
                _button("Buy Now", Colors.deepOrange),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "You"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Rufus"),
        ],
      ),
    );
  }

  Widget _colorCircle(String name, Color color) {
    final bool isSelected = selectedColor == color;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
          selectedColorName = name;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.black,
            width: isSelected ? 3 : 1,
          ),
        ),
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white, size: 18)
            : null,
      ),
    );
  }

  Widget _button(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}