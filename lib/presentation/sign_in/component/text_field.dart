import 'package:flutter/material.dart';

class TextFieldSignIn extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  const TextFieldSignIn({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(143, 148, 251, 1)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(143, 148, 251, .2),
            blurRadius: 20.0,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(143, 148, 251, 1),
                ),
              ),
            ),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
