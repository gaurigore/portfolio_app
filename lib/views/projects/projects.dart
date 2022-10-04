import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/FirebaseServices/FirebaseHelper.dart';

import '../../dimention_constant.dart';
class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  static final Stream<QuerySnapshot> _usersStream = FirebaseHelper.projects.orderBy('savedAt',descending: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return GridView.builder(

          //scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: DimensionConstant.defaultSpacing,
            mainAxisSpacing: DimensionConstant.defaultSpacing,
            childAspectRatio: 1.5,
          ),
          itemCount: snapshot.data?.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                color: Colors.grey.shade900,
                child: Column(
                  children:  [

                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Text(snapshot.data?.docs[index]['project_name'],style: Theme.of(context).textTheme.subtitle2,),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(snapshot.data?.docs[index]['description']),
                    ),

                  ],
                ),
              ),
            );
          },

        );;
      },
    );
  }
}
