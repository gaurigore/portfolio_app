import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/FirebaseServices/FirebaseHelper.dart';
import 'package:my_portfolio/dimention_constant.dart';
import 'package:my_portfolio/views/projects/projects.dart';
import 'package:my_portfolio/views/side_menu.dart';
import 'package:my_portfolio/widgets/opening_chat.dart';
import 'package:my_portfolio/widgets/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FirebaseHelper firebaseHelper = FirebaseHelper();

  static String userToken = " ";

  Future<void> generateToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken(
      vapidKey: dotenv.env['VAPID_KEY'],
    );
    userToken = token!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: Colors.amber,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
      drawer: const SideMenu(),
      body: Container(
        constraints: const BoxConstraints(maxWidth: DimensionConstant.maxWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 2,
                child: SideMenu(),
              ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Image(
                        image: const AssetImage("assets/images/portfolio.jpg"),
                        fit: BoxFit.fitWidth,
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.86),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: DimensionConstant.defaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Text("Discover My Amazing\n Art Space!",
                                style: Responsive.isDesktop(context)
                                    ? Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)
                                    : Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                            const SizedBox(
                              height: DimensionConstant.defaultPadding,
                            ),
                            DefaultTextStyle(
                              style: Theme.of(context).textTheme.subtitle1!,
                              child: Responsive.isMobile(context)
                                  ? Row(
                                      children: [
                                        const Text("I build "),
                                        AnimatedTextKit(
                                          animatedTexts: [
                                            TyperAnimatedText(
                                                "responsive mobile and web app",
                                                speed: const Duration(
                                                    microseconds: 40)),
                                            TyperAnimatedText(
                                                "complete e-commerce app UI"),
                                          ],
                                          repeatForever: true,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        const Text.rich(
                                            TextSpan(text: "<", children: [
                                          TextSpan(
                                              text: "Flutter",
                                              style: TextStyle(
                                                  color: Colors.amber)),
                                          TextSpan(text: "> "),
                                        ])),
                                        const SizedBox(
                                          width:
                                              DimensionConstant.defaultPadding /
                                                  2,
                                        ),
                                        const Text("I build "),
                                        AnimatedTextKit(
                                          animatedTexts: [
                                            TyperAnimatedText(
                                                "responsive mobile and web app",
                                                speed: const Duration(
                                                    microseconds: 40)),
                                            TyperAnimatedText(
                                                "complete e-commerce app UI"),
                                          ],
                                          repeatForever: true,
                                        ),
                                        const SizedBox(
                                          width:
                                              DimensionConstant.defaultPadding /
                                                  2,
                                        ),
                                        const Text.rich(
                                            TextSpan(text: "<", children: [
                                          TextSpan(
                                              text: "Flutter",
                                              style: TextStyle(
                                                  color: Colors.amber)),
                                          TextSpan(text: "> "),
                                        ])),
                                      ],
                                    ),
                            ),
                            const SizedBox(
                              height: DimensionConstant.defaultPadding,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Download Resume",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.amber)),
                            ),
                          ],
                        ),
                      )
                    ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                              DimensionConstant.defaultPadding),
                          child: Text(
                            "My Projects",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Projects(),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)))),
                          onPressed: () {
                            showGeneralDialog(
                                context: context,
                                pageBuilder: (_, __, ___) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 200,
                                        right: 0,
                                        left: 400,
                                        bottom: 100),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: Card(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: TextField(
                                                  controller: nameController,
                                                  decoration: const InputDecoration(
                                                      hintText: "Enter Name",
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: TextField(
                                                  controller: emailController,
                                                  decoration: const InputDecoration(
                                                      hintText: "Enter Email",
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ElevatedButton(
                                                        child:
                                                            const Text("Start"),
                                                        onPressed: () async {
                                                          final snapShot =
                                                              await FirebaseHelper
                                                                  .chats
                                                                  .doc(
                                                                      emailController
                                                                          .text)
                                                                  .collection(
                                                                      emailController
                                                                          .text)
                                                                  .get();

                                                          if (snapShot.size !=
                                                              0) {
                                                            print(
                                                                "allready exist");
                                                            var id= await FirebaseHelper.chats
                                                                .doc(emailController.text)
                                                                .collection(emailController.text).where("email", isEqualTo: emailController.text)
                                                              .get();
                                                            String docId=id.docs[0].id;



                                                            FirebaseHelper
                                                                .updateTokens(
                                                                    userToken,
                                                                    emailController
                                                                        .text,docId);

                                                            MyDialog(
                                                                context,
                                                                emailController
                                                                    .text);
                                                          } else {
                                                            firebaseHelper.adduser(
                                                                nameController
                                                                    .text,
                                                                emailController
                                                                    .text,
                                                                userToken);

                                                            print("making new");

                                                            MyDialog(
                                                                context,
                                                                emailController
                                                                    .text);
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ElevatedButton(
                                                          child: const Text(
                                                              "cancel"),
                                                          onPressed: () {
                                                            Get.back();
                                                            emailController.clear();
                                                            nameController.clear();
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: const Icon(
                            Icons.message,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
