import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/FirebaseServices/FirebaseHelper.dart';

import '../../dimention_constant.dart';

class MyProfile extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream = FirebaseHelper.profile.snapshots();

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

        return ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 1.23,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                          child: Column(
                        children: [
                          const Spacer(
                            flex: 2,
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(data['image']),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  data['name'],
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text("Flutter  Developer"),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(DimensionConstant.defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Residence  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        data['residence'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(DimensionConstant.defaultPadding),
                  child: Row(
                    children: [
                      const Text(
                        "City ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        data['city'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(DimensionConstant.defaultPadding),
                  child: Row(
                    children: [
                      const Text(
                        "Age",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        data['age'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: DimensionConstant.spaceBetwwenTwoText,
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
