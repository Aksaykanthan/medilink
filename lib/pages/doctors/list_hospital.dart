import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_01/getdata/get_hospital.dart';


class HospitalList extends StatefulWidget {
  const HospitalList({super.key});

  @override
  State<HospitalList> createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  List<String> hospID = [];

  Future getAllHosp() async {
    hospID.clear();
    await FirebaseFirestore.instance.collection("hospital").get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            hospID.add(element.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getAllHosp(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: hospID.length,
                itemBuilder: (context, index) {
                  return GetHospital(hospID: hospID[index]);
                });
          }),
    );
  }
}
// class HospitalList extends StatelessWidget {
//   const HospitalList({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return const Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               HospitalCard(data: null,),
//               SizedBox(height: 20,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
