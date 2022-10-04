import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:my_portfolio/FirebaseServices/FirebaseHelper.dart';


import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../dimention_constant.dart';

class  Skills extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream = FirebaseHelper.skills.snapshots();
  //final List<SkillsModel> skillsList=[];

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return Container(
              width: MediaQuery.of(context).size.width * 0.2 ,
              height: MediaQuery.of(context).size.height * 0.2 ,
              child: ListView.builder(
               // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
                  child: CircularPercentIndicator(
                    backgroundColor: Colors.transparent,
                    radius: 25.0,
                    lineWidth: 5.0,
                    percent: double.parse(snapshot.data?.docs[index]['percentage']),

                    center: const Text("70%"),
                    progressColor: Colors.amber,
                    footer:  Padding(
                      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
                      child: Text(snapshot.data?.docs[index]['language']),
                    ),
                  ),
                );

              }),
            );
          },
        ),
      ],
    );






  }
}
