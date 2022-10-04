import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/FirebaseServices/FirebaseHelper.dart';
import 'package:my_portfolio/views/chat/chats.dart';

void MyDialog(BuildContext context, String email) {
  TextEditingController messageController = TextEditingController();
  showGeneralDialog(
    context: Get.context!,
    barrierColor: Colors.black54,
    barrierDismissible: true,
    barrierLabel: 'Label',
    pageBuilder: (_, __, ___) {
      return Padding(
        padding: const EdgeInsets.only(top: 100, right: 20, bottom: 30),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Colors.blue,
            child: SizedBox(
              width: MediaQuery.of(Get.context!).size.width * 0.3,
              height: MediaQuery.of(Get.context!).size.height * 0.8,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(Get.context!).size.height * 0.1),
                  child: AppBar(
                    leading: const Padding(
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 0),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                            "https://gravatar.com/avatar/goregauri?s=32&d=identicon&r=PG"),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Gauri"),
                        Text(
                          "goregauri31@gmail.com",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    centerTitle: false,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                ),
                body: Chats(email),
                bottomNavigationBar: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            //minWidth: ,
                            //maxWidth: ,
                            minHeight: 25.0,
                            maxHeight: 150.0,
                          ),
                          child: Scrollbar(
                            child: TextField(
                              controller: messageController,
                              cursorColor: Colors.red,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,

                              //controller: tc,
                              // _handleSubmitted : null,
                              decoration: InputDecoration(
                                //prefixIcon: IconButton(icon: Icon(Icons.mood,color: Colors.amber,),onPressed: (){},),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                fillColor: Colors.grey.shade800,
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    top: 30.0,
                                    left: 13.0,
                                    right: 13.0,
                                    bottom: 2.0),
                                hintText: "Type your message",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 20,
                      child: Center(
                          child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          size: 18,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          if (messageController.text.isNotEmpty) {
                            FirebaseHelper.addMessage(
                                email, messageController.text.toString());
                            messageController.text = "";
                            var id = await FirebaseFirestore.instance
                                .collection("users")
                                .where("email", isEqualTo: email)
                                .get();

                            print("here is id");
                            String docId = id.docs[0].id;

                            FirebaseHelper.user
                                .doc(docId)
                                .update({'joinedAt': DateTime.now()});

                          }
                        },
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
