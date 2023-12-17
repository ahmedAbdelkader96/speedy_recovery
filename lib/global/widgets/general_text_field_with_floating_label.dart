import 'package:flutter/material.dart';
import 'package:speedy_recovery_test/global/helpers_methods_functions/media_query.dart';



class GeneralTextFieldWithFloatingLabel extends StatelessWidget {
  const GeneralTextFieldWithFloatingLabel(
      {Key? key,
      required this.controller,
      this.onTap,
      required this.labelText,
      this.obscureText,
      required this.onChanged,required this.validator})
      : super(key: key);
  final TextEditingController controller;
  final Function? onTap;
  final bool? obscureText;
  final String labelText;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MQuery.getheight(context, 60),
      width: MQuery.getWidth(context, 328),
      constraints:  BoxConstraints(minHeight: MQuery.getheight(context, 40) ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MQuery.getheight(context, 10)) ,
        color: const Color(0xFFF4F4F4),
        boxShadow: [
          BoxShadow(
          color: const Color(0xFF686868).withOpacity(0.25),
        offset: const Offset(0.0, 2),
        blurRadius: 4,
        spreadRadius: 0
    ),
    ]
      ),
      padding: EdgeInsets.only(left: MQuery.getheight(context, 16),right: MQuery.getheight(context, 16)),
      child: Center(
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          validator: validator,


          toolbarOptions: const ToolbarOptions(
              copy: true, cut: true, paste: true, selectAll: true),
          style:  const TextStyle(
              fontSize: 16,fontWeight: FontWeight.w500,
              color: Colors.black),
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          keyboardType: TextInputType.text,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          controller: controller,
          textInputAction: TextInputAction.done,

          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding:  EdgeInsets.only(
                top: MQuery.getheight(context, 5),
              ),
              labelText: labelText,
              labelStyle:  const TextStyle(
                color: Colors.grey
                  //height: 1.4,
                  ),
              floatingLabelStyle:  const TextStyle(
                color: Colors.grey,
                fontSize: 16,fontWeight: FontWeight.w500,
                //height: 1.4
              )
          ),
        ),
      ),
    );
  }
}
