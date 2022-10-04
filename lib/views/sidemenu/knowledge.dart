import 'package:flutter/material.dart';

import '../../dimention_constant.dart';

class Knowledge extends StatelessWidget {
  late String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: DimensionConstant.defaultPadding / 2),
      child: Row(
        children: [
          const Icon(Icons.check_box,size: 18,color: Colors.amber,),

          const SizedBox(
            width: DimensionConstant.defaultPadding / 2,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Knowledge({required this.text});
}
