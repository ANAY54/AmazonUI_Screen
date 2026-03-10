import 'package:flutter/material.dart';
import 'create_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AmazonAuthPage(),
    );
  }
}

class AmazonAuthPage extends StatefulWidget {
  const AmazonAuthPage({super.key});

  @override
  State<AmazonAuthPage> createState() => _AmazonAuthPageState();
}

class _AmazonAuthPageState extends State<AmazonAuthPage> {
  bool _showPassword = false;
  bool _keepSignedIn = false;

  static const BorderSide amazonBorder =
  BorderSide(color: Colors.black54, width: 1);

  static const BoxShadow amazonButtonShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.12),
    blurRadius: 4,
    offset: Offset(0, 2),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            /// Header
            Container(
              height: 64,
              width: double.infinity,
              color: const Color(0xFFF3F3F3),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/amazon_logo.png',
                height: 40,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0066C0),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      _textField("Enter Email or Mobile Phone Number"),
                      const SizedBox(height: 12),
                      _textField("Password", obscure: !_showPassword),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Checkbox(
                            value: _showPassword,
                            onChanged: (v) =>
                                setState(() => _showPassword = v!),
                          ),
                          const Text("Show Password"),
                        ],
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: _keepSignedIn,
                            onChanged: (v) =>
                                setState(() => _keepSignedIn = v!),
                          ),
                          const Text("Keep me Signed in. "),
                          const Text(
                            "Details",
                            style: TextStyle(color: Color(0xFF0066C0)),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      _amazonButton(
                        text: "Sign in",
                        background: const Color(0xFFF0C14B),
                        onTap: () {},
                      ),

                      const SizedBox(height: 24),

                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "New to Amazon?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),

                      const SizedBox(height: 20),

                      _amazonButton(
                        text: "Create a New Amazon Account",
                        background: const Color(0xFFE7E9EC),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CreateAccountPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(String hint, {bool obscure = false}) {
    return SizedBox(
      height: 46,
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: amazonBorder,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }

  Widget _amazonButton({
    required String text,
    required Color background,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: background,
            border: Border.all(color: Colors.black54),
            boxShadow: const [amazonButtonShadow],
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}