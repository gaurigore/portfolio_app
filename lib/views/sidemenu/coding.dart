import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/responsive.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../dimention_constant.dart';

class Coding extends StatelessWidget {
  const Coding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: DimensionConstant.spaceBetwwenTwoText,),
        const Text(
          "Coding ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: DimensionConstant.spaceBetwwenTwoText,
        ),
        Row(
          children: const [
            Text("Flutter"),
            Spacer(),
            Text(
              "90.0%",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: DimensionConstant.spaceBetwwenTwoText,
        ),
        LinearPercentIndicator(
          //width: Responsive.isMobile(context)?MediaQuery.of(context).size.width * 0.4:MediaQuery.of(context).size.width * 0.1800,
          animation: true,
          lineHeight:8.0,
          restartAnimation: true,
          animationDuration: 2000,
          percent: 0.9,

          //barRadius: const Radius.circular(6),
          progressColor: Colors.amber,
        ),
        const SizedBox(
          height: DimensionConstant.spaceBetwwenTwoText,
        ),
        Row(
          children: const [
            Text("Dart"),
            Spacer(),
            Text("80.0%", style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(
          height: DimensionConstant.spaceBetwwenTwoText,
        ),
        LinearPercentIndicator(
         // width: MediaQuery.of(context).size.width * 0.1800,
          animation: true,
          lineHeight: 8.0,
          restartAnimation: true,
          animationDuration: 2000,
          percent: 0.8,

          //barRadius: const Radius.circular(6),
          progressColor: Colors.amber,
        ),
        const SizedBox(
          height: DimensionConstant.spaceBetwwenTwoText,
        ),
        Row(
          children: const [
            Text("java"),
            Spacer(),
            Text("70.0%", style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        LinearPercentIndicator(
          //width: MediaQuery.of(context).size.width * 0.1800,
          animation: true,
          lineHeight: 8.0,
          restartAnimation: true,
          animationDuration: 2000,
          percent: 0.7,

          //barRadius: const Radius.circular(6),
          progressColor: Colors.amber,
        ),
        const SizedBox(
          height: DimensionConstant.spaceBetwwenTwoText,
        ),
        Row(
          children: const [
            Text("HTML"),
            Spacer(),
            Text("90.0%", style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(
          height: DimensionConstant.spaceBetwwenTwoText,
        ),
        LinearPercentIndicator(
          //width: MediaQuery.of(context).size.width * 0.1800,
          animation: true,
          lineHeight: 8.0,
          restartAnimation: true,
          animationDuration: 2000,
          percent: 0.9,

          //barRadius: const Radius.circular(6),
          progressColor: Colors.amber,
        ),
        const SizedBox(
          height: DimensionConstant.spaceBetwwenTwoText,
        ),
       const Divider(),
      ],
    );
  }
}
