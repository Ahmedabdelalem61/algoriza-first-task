import 'package:algoriza_first_task/base_component/base_component.dart';
import 'package:algoriza_first_task/resourse_manager/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../resourse_manager/asset_manager.dart';
import '../register/register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  PhoneNumber? _phoneNumber;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState>? _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.nav),
                const Text(AppStrings.welcome),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Text(
                      AppStrings.signIn,
                      style: TextStyle(fontSize: 25),
                    ),
                    const Spacer(),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                AppStrings.help,
                                style: TextStyle(color: Colors.redAccent),
                              ),
                              Icon(
                                Icons.help,
                                color: Colors.redAccent,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                CountryPickerWithFromField((phone) {_phoneNumber = phone;}),
                const SizedBox(
                  height: 12,
                ),
                CustomMaterailButton(
                    borderRadious: 15,
                    buttonColor: Theme.of(context).primaryColor,
                    width: double.infinity,
                    callback: () {
                      if (_formKey!.currentState!.validate()) {
                        //do something
                      }
                    },
                    child: const Text(AppStrings.login,style: TextStyle(color: Colors.white))),
                const SizedBox(
                  height: 12,
                ),
                CustomMaterailButton(
                    borderRadious: 15,
                    buttonColor: Theme.of(context).primaryColor,
                    width: double.infinity,
                    callback: () {
                      if (_formKey!.currentState!.validate()) {
                        //do something
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageAssets.googleLogo),
                        SizedBox(width: 5,),
                        const Text(AppStrings.signInWithGoogle,style: TextStyle(color: Colors.white),),
                      ],
                    )),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Text(AppStrings.haveAccount),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterView()));
                        },
                        child: const Text(AppStrings.register,style: TextStyle(color: Colors.redAccent),),
                    ),],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(AppStrings.sampleText,style: Theme.of(context).textTheme.caption),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
