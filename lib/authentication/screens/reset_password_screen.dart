import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xinner/authentication/screens/login_screen.dart';

import 'package:xinner/utils/constants/sizes.dart';
import 'package:xinner/utils/constants/text_strings.dart';
import 'package:xinner/utils/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  double imageWidth = THelperFunctions.screenWidth()*0.6;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        //  appBar: AppBar(actions: [IconButton(onPressed: (){}, icon: Icon())],),
        body: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            TTexts.changeYourPasswordTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            TTexts.changeYourPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                  child: const Text("Done"))),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
        ],
      ),
    ));
  }
}
