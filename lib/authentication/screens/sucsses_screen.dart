import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xinner/authentication/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:xinner/utils/constants/sizes.dart';
import 'package:xinner/utils/constants/text_strings.dart';
import 'package:xinner/utils/helper_functions.dart';


class SuccessScreen extends StatelessWidget {
  double imageWidth = THelperFunctions.screenWidth()*0.6;
 SuccessScreen( {super.key,required this.image, required this.subTitle,required this.title});
  final String  image,title, subTitle; 
  @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(actions: [IconButton(onPressed: (){Get.to(()=>LoginScreen());}, icon: Icon(Icons.close))],),
        body: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image:  AssetImage(
                image),
            width: imageWidth,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
         
          Text(TTexts.confirmEmail,
                                       style: Theme.of(context).textTheme.headlineMedium,
                                       textAlign: TextAlign.center,),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            Text("$title",style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            Text("$subTitle",
                              style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
                            const SizedBox(height: TSizes.defaultSpace,),  
                            SizedBox(width:  double.infinity,
                                     child: ElevatedButton(onPressed: ()async{
                                    await ScaffoldMessenger.of(context).showSnackBar(
                            const  SnackBar(backgroundColor: Colors.green,content:  Text( 
                           'you can now login in your account  '),)
                );
                                     Get.off(LoginScreen());

                                     }, child:const  Text("Done")), ) ,
                                      
                            
        ],
      ),
    ));
  }
}



