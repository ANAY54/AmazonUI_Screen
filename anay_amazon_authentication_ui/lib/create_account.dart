import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

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

                      const Text(
                        "Create account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 20),

                      _textField("Your name"),
                      const SizedBox(height: 12),
                      _textField("Email"),
                      const SizedBox(height: 12),
                      _textField("Password"),
                      const SizedBox(height: 12),
                      _textField("Re-enter password"),

                      const SizedBox(height: 18),

                      _amazonButton("Continue"),

                      const SizedBox(height: 16),

                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                          children: [
                            TextSpan(
                              text:
                              "By creating an account, you agree to Amazon’s ",
                            ),
                            TextSpan(
                              text: "Conditions of Use",
                              style:
                              TextStyle(color: Color(0xFF0066C0)),
                            ),
                            TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Notice.",
                              style:
                              TextStyle(color: Color(0xFF0066C0)),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          "Already have an account? Sign in",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0066C0),
                          ),
                        ),
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

  Widget _textField(String hint) {
    return SizedBox(
      height: 46,
      child: TextField(
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

  Widget _amazonButton(String text) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF0C14B),
            border: Border.all(color: Colors.black54),
            boxShadow: const [amazonButtonShadow],
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}