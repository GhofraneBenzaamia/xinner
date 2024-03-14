import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'package:get/get.dart';

import 'package:xinner/authentication/screens/sign_in_screen.dart';
import 'package:xinner/authentication/screens/sucsses_screen.dart';
import 'package:xinner/utils/constants/sizes.dart';
import 'package:xinner/utils/constants/text_strings.dart';
import 'package:xinner/utils/helper_functions.dart';
import 'package:xinner/authentication/controlers/sign-up-controler.dart';

class VerifyEmailSreen extends StatelessWidget {
  VerifyEmailSreen({super.key, });
  
  final auth = FirebaseAuth.instance;
  double imageWidth = THelperFunctions.screenWidth()*0.6; 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(() =>  SignInScreen());
          },
          color: THelperFunctions.isDarkMode(context)
              ? Colors.white
              : Colors.black,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage(
                       "assests/images/sammy-line-man-receives-a-mail.png"),
                    width: imageWidth,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Text(
                    TTexts.confirmEmail,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    TTexts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async{
                          try{
                               User? user = FirebaseAuth.instance.currentUser;
                                await user?.reload();
                            if(FirebaseAuth.instance.currentUser!.emailVerified){
                            
                            Get.to(SuccessScreen(
                            image: "assests/images/sammy-line-success.png",
                            title: TTexts.yourAccountCreatedTitle,
                            subTitle: TTexts.yourAccountCreatedSubTitle,
                          )
                          );
                         // } 
                             }
                             else {
                              ScaffoldMessenger.of(context).showSnackBar(
                         const  SnackBar(backgroundColor: Colors.red,content:  Text( 
                          'You have to verify your email '),)
                );
                             } }
                          catch(e){
                                ScaffoldMessenger.of(context).showSnackBar(
                         const  SnackBar(backgroundColor: Colors.red,content:  Text( 
                          'You have to verify your email '),)
                );
                          }
                           
                        },
                        child: const Text("Continue")),
                  ),
                ],
              ))),
    );
  }
}
