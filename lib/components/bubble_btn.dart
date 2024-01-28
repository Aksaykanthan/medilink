import 'package:flutter/material.dart';

class BubbleButton extends StatelessWidget {
  final color;
  final String text;
  final void Function()? onTap;
  const BubbleButton({super.key, this.color, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(45),color: color),
                    width: 40,
                    height: 40,
                    // color: Colors.black,
                    child: Center(child: Text(text,style:TextStyle(color:Colors.white),textAlign: TextAlign.center,))
                    
                  ),
                ),
              );
  }
}