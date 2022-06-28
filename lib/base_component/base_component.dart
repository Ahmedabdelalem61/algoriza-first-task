import 'package:algoriza_first_task/resourse_manager/strings_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
import 'dart:ui';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomMaterailButton extends StatelessWidget {
  Color buttonColor;
  Color? textColor;
  double borderRadious;
  Widget child;
  double width;
  VoidCallback callback;

  CustomMaterailButton(
      {Key? key,
      required this.borderRadious,
      required this.buttonColor,
      required this.child,
      this.textColor,
      required this.width,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: width,
      height: 45.0,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadious)),
      child: MaterialButton(
        onPressed: callback,
        child: child,
      ),
    );
  }
}

Widget CountryPickerWithFromField(void onChange(PhoneNumber? phone)) =>
    IntlPhoneField(
      validator: (value){
        if(value?.number.isNotEmpty??false)
          return null;
        return AppStrings.phoneNumberValidationError;
      },
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(
              color: Colors.redAccent)
          ),
          labelText: 'Phone Number',
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'EG',
        onChanged: (phone) {
          onChange(phone);
        });


Widget DefaultTextFormField({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType type,
  dynamic onSubmit,
  dynamic onChange,
  dynamic onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  dynamic suffixPressed
}) {
  return TextFormField(

    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validate,
    onTap: onTap,
    decoration: InputDecoration(
      iconColor:  Colors.grey,
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      focusColor: Theme.of(context).primaryColor ,
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(prefix,color: Colors.redAccent,),
      suffixIcon: suffix != null ? IconButton(icon: Icon(suffix), onPressed: suffixPressed) : null,
border: const OutlineInputBorder(),
    ),
  );
}
