import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            "assets/images/logo.png",
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                "Listagem de Produtos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
