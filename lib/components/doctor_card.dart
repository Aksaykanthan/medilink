import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 6), // changes position of shadow
                ),
              ]),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(children: [
              Image.asset(
                'assets/icons/shaun.jpeg',
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      const Text(
                        "Dr Shaun Murphy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 150,
                        height: 2,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "ROck",
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ));
  }
}
