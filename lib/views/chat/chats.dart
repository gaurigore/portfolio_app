import 'dart:html';

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/FirebaseServices/FirebaseHelper.dart';

class Chats extends StatelessWidget {
  String email;
  Chats(this.email, {Key? key}) : super(key: key);
  ScrollController scrollController=ScrollController();




  @override
  Widget build(BuildContext context) {
    print(email);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(

        physics: BouncingScrollPhysics(),


        child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats').doc(email).collection(email).orderBy('dateTime').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          WidgetsBinding.instance?.addPostFrameCallback((_) {
            if (scrollController.hasClients) {
              scrollController.jumpTo(scrollController.position.maxScrollExtent);
            }
          });

          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {

            return Text("Loading");
          }

          return ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              print(data);
              print(document.id);
              return ListTile(
                title: Bubble(
                  margin: BubbleEdges.only(top: 5),
                  alignment:data['sender']==1? Alignment.topRight:Alignment.topLeft,
                  nipWidth: 8,
                  nipHeight: 24,
                  nip: data['sender']==0?BubbleNip.leftTop:BubbleNip.rightTop,
                  color: data['sender']==0?  Color(0xFF25D366): const Color(0xFF075E54),
                  child: data['message']!=null?Text(data['message'],):const Text("No message yet!"),
                ),



              );
            }).toList(),
          );
        },
        ),
      ),
    );
  }
}
