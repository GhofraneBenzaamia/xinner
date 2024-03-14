import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xinner/authentication/screens/reset_password_screen.dart';
import 'package:xinner/utils/constants/sizes.dart';
import 'package:xinner/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key, });
late  String email;
GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TextFormField(
             onChanged: (value) => email = value,
              decoration: const InputDecoration(
                  labelText: "E-Mail", prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  
                    onPressed: 

                    ()async {
                     try  {
                       
                       await  FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                    Get.to(
                        ResetPasswordScreen());
                    }
                        catch(e){
                          // ignore: use_build_context_synchronously
                          AwesomeDialog(context: context,
                      dialogType: DialogType.error,
                      title: "error",
                      desc: "please enter valid email ",
                      animType: AnimType.bottomSlide).show();
                        }
                    },
                    child:const  Text("Submit")))
          ],
        ),
      ),
    );
  }
}
