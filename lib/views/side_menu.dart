import 'package:flutter/material.dart';
import 'package:my_portfolio/dimention_constant.dart';
import 'package:my_portfolio/views/sidemenu/coding.dart';
import 'package:my_portfolio/views/sidemenu/knowledge.dart';
import 'package:my_portfolio/views/sidemenu/my_profile.dart';
import 'package:my_portfolio/views/sidemenu/skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyProfile(),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Skills ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: DimensionConstant.spaceBetwwenTwoText,
                  ),
                  Skills(),
                  const Divider(),


                  const Coding(),
                  Text(
                    "Knowledge",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(
                    height: DimensionConstant.spaceBetwwenTwoText,
                  ),
                  Knowledge(text: "Flutter ,Dart"),
                  Knowledge(text: "Java  ,C++"),
                  Knowledge(text: "HTML  ,CSS"),
                  Knowledge(text: "SqLite ,REST APIs"),
                  Knowledge(text: "Firebase ,Firestore"),
                  const Divider(),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      label: const Text(
                        "Download CV",
                        style: TextStyle(color: Colors.grey),
                      ),
                      icon: const Icon(
                        Icons.download,
                        textDirection: TextDirection.ltr,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image:
                                AssetImage("assets/images/Linkedin_icon.png"),
                            height: 20,
                            width: 20,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image:
                                AssetImage("assets/images/github5.png"),
                            height: 20,
                            width: 20,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image:
                                AssetImage("assets/images/Twitter-Logo-Square.png"),
                            height: 20,
                            width: 20,
                          )),

                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
