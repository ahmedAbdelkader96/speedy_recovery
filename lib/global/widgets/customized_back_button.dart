import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomizedBackButton extends StatelessWidget {
  const CustomizedBackButton({Key? key,  this.onPressed}) : super(key: key);
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          RawMaterialButton( onPressed: onPressed ?? (){
            Get.back();
          },
            shape: const CircleBorder(),
            elevation: 0,
            constraints: const BoxConstraints(
              minWidth: 50,maxWidth: 50,maxHeight: 50,minHeight: 50
            ),
            child: const Icon(Icons.arrow_back),

          )
        ],
      ) ;
  }
}
