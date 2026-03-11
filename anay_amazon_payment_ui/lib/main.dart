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
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = -1;

  final List<String> methods = [
    "Amazon Pay UPI",
    "Other UPI Apps",
    "Add a new credit card",
    "EMI",
    "Net Banking",
    "Cash on Delivery",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            /// 🔵 LIGHT BLUE HEADER BAR
            Container(
              height: 48,
              width: double.infinity,
              color: const Color(0xFFBFE6F6),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// DELIVERY INFO
                    const Text(
                      "Delivering to Jinendra Pamecha",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Kopou Boys Hostel, near symbiosis international school, "
                          "symbiosis road, viman nagar, pune, Maharashtra",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// CONTINUE BUTTON (TOP)
                    _yellowButton("Continue"),

                    const SizedBox(height: 24),

                    const Text(
                      "Select a payment method",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// PAYMENT METHOD BOX (BORDERED)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Column(
                        children: List.generate(methods.length, (index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() => selectedIndex = index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 14),
                                  child: Row(
                                    children: [
                                      Radio<int>(
                                        value: index,
                                        groupValue: selectedIndex,
                                        onChanged: (v) {
                                          setState(() => selectedIndex = v!);
                                        },
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        methods[index],
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (index != methods.length - 1)
                                Divider(
                                  height: 1,
                                  color: Colors.grey.shade300,
                                ),
                            ],
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 24),


                    _yellowButton("Continue"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _yellowButton(String text) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD814),
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}