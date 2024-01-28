import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundImg extends StatelessWidget {
  RoundImg(this.imageUrl,{
    super.key,
  });
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          width: 500,
          height: 300,
          image: NetworkImage(imageUrl),fit: BoxFit.contain,),
      ),
    );
  }
}