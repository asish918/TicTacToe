import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 0,
          )
        ]
      ),
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Text(text, style: TextStyle(fontSize: 16),),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, 50),
        ),
      ),
    );
  }
}
