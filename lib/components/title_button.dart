
import 'package:flutter/material.dart';

class TitleBtn extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const TitleBtn({super.key,required this.icon,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon,color: Colors.white,),
        title: Text(text,style: const TextStyle(color: Colors.white),),
    
      ),
    );
  }
}