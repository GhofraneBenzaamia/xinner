

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import 'package:iconsax/iconsax.dart';
import 'package:xinner/authentication/screens/login_screen.dart';
import 'package:xinner/utils/helper_functions.dart';
import 'package:get/get.dart';
import 'package:xinner/authentication/screens/email_verification_screen.dart';
import 'package:xinner/utils/constants/colors.dart';
import 'package:xinner/utils/constants/sizes.dart';
import 'package:xinner/utils/constants/text_strings.dart';
import 'package:xinner/utils/helper_functions.dart';
import 'package:xinner/authentication/controlers/sign-up-controler.dart';

/*
class SignInScreen extends StatefulWidget{
  @override
  State<SignInScreen> createState() => SignInScreenState();
    
  

}*/

class SignInScreen extends StatelessWidget{
  const SignInScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(leading :IconButton(onPressed:(){Get.back();}, icon:const  Icon(Icons.arrow_back),color: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.black,),),
       body:   SingleChildScrollView(
        child: Padding(padding:const  EdgeInsets.only(top: 8,
                                                      bottom: TSizes.defaultSpace,
                                                      left: TSizes.defaultSpace,
                                                      right: TSizes.defaultSpace),
                       child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
                          const  SizedBox(height: 15,),
                            SignUpForm(),
                         
                              
         
                        ],
                       ),)
       ),
    );
    
  }

}

class SignUpSocialIcons extends StatelessWidget {
  const SignUpSocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Container(
        decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100),
               ),
        child: IconButton(onPressed: (){}, icon: const Image(width:TSizes.iconMd, 
                               height: TSizes.iconMd,
                               image: AssetImage("assests/images/google-icon.png"),      )), 
            ),
    const  SizedBox(width: TSizes.spaceBtwItems),
      Container(
       decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100),
               ),
              child: IconButton(onPressed: (){}, icon: const Image(width:TSizes.iconMd, 
                               height: TSizes.iconMd,
                               image: AssetImage("assests/images/facebook-icon.png"),      )), 
            )
          ],
        );
  }
}

class SignUpDivider extends StatelessWidget {
  const SignUpDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: Divider(color: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.grey,
                                              thickness: 0.5,
                                              indent:60 ,
                                              endIndent: 5,)),
                      Text("Or sign in with", style: Theme.of(context).textTheme.labelMedium,),
                   
                      Flexible(child: Divider(color: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.grey,
                                              thickness: 0.5,
                                              indent:5 ,
                                              endIndent: 60,)),
         
                  ],);
  }
}

class SignUpForm extends StatefulWidget{
  @override
  State<SignUpForm> createState() => SignUpFormState();

}


class SignUpFormState extends State<SignUpForm> {
 TextEditingController passwordController  = TextEditingController();
   String  fullName =" " , email = " ", password = "" , confirmedPasword= "";
  final auth = FirebaseAuth.instance;
  final databaseReference = FirebaseFirestore.instance;
  
  bool cheked = false;
  bool isVisible = true;

  GlobalKey<FormState> formState = GlobalKey();

  

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: formState,
      child: Column(
       children: [
                  
       TextFormField(
        onChanged: (value)=> fullName = value,
        validator: (value) {
          List<String> names = value!.split(' ');
          if((value!.isEmpty) ||(names.length < 2)) return  ("enter your full name please"); return null;
 },
        expands: false,
        decoration: const InputDecoration(
          labelText: "Full name ",
          prefixIcon: Icon(Iconsax.user),
        ),
      ),
    
    const  SizedBox(height: 12),       
         TextFormField(
          onChanged: (value) => email = value,
                 validator: (Value)  {
                  if(Value?.isEmpty == true) {
                    return " Please enter your email";
                  } else
                  if(!Value!.endsWith("@gmail.com")) return "invalid email";
              
                 },
                 expands: false,
                 decoration: const InputDecoration(
                   labelText: "E-Mail",
                   prefixIcon: Icon(Iconsax.direct),
                 ),
               ),

         const SizedBox(height:12,),      
         TextFormField(
          controller: passwordController,
          obscureText: isVisible,
          onChanged: (value) => password = value,
             validator: (value) {
              if(password.isEmpty == true) return "Please neter the password";
                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$').hasMatch(value!)) {
                 return 'Password must contain at least one uppercase letter, one number, one special character, and be at least 6 characters long';
  }
        },
                 expands: false,
                 decoration:  InputDecoration(
                   labelText: "Password",
                   prefixIcon: Icon(Iconsax.password_check),
                   suffixIcon: GestureDetector(onTap: () => 
                  setState(() {
                    isVisible = !isVisible;
                  }),
                  child: isVisible? const Icon(Icons.visibility_off):const Icon(Icons.visibility)

                  ) ,
                 ),
               ), 
                const SizedBox(height: 12,), 
                   TextFormField(
          onChanged: (value) => confirmedPasword = value,
             validator: (value) {
               if (confirmedPasword != password) {
                return 'Passwords do not match';
              }
        },
                 expands: false,
                 decoration:  InputDecoration(
                   labelText: " confirm password",
                   prefixIcon: Icon(Iconsax.password_check),
                   suffixIcon: GestureDetector(onTap: () => 
                  setState(() {
                    isVisible = !isVisible;
                  }),
                  child: isVisible? const Icon(Icons.visibility_off):const Icon(Icons.visibility)

                  ) , 
                 ),
               ), 
                const SizedBox(height: 12,),       
          Row(children: [
                     //   const SizedBox(height: Sizes.xs,),   
          SizedBox(width: 24, height: 24,
            child: Checkbox(value: cheked,
            
             onChanged:( value)=>
             setState(() {
               cheked = !cheked;
             })
              
             ),),
           const  SizedBox(width: TSizes.spaceBtwItems,),
           Text.rich(TextSpan(children: [
             TextSpan(text: "I Agree to ", style: Theme.of(context).textTheme.bodySmall),
             TextSpan(text: "Privacy Policy ", style: Theme.of(context).textTheme.bodyMedium!.apply(
               color: THelperFunctions.isDarkMode(context ) ? Colors.white : TColors.primary,
               decoration: TextDecoration.underline,
               decorationColor: THelperFunctions.isDarkMode(context) ? Colors.white : TColors.primary
             )),
             TextSpan(text: "and ", style: Theme.of(context).textTheme.bodySmall),
             TextSpan(text: "Term of use ", style: Theme.of(context).textTheme.bodyMedium!.apply(
               color: THelperFunctions.isDarkMode(context ) ? Colors.white : TColors.primary,
               decoration: TextDecoration.underline,
               decorationColor: THelperFunctions.isDarkMode(context) ? Colors.white : TColors.primary
             )),
             
           ])),
          ],)  ,    

    
             const  SizedBox(height: TSizes.spaceBtwItems,),
             SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()async{
              if (!cheked){
                ScaffoldMessenger.of(context).showSnackBar(
                 const  SnackBar(backgroundColor: Colors.red,content:  Text('You have to agree to the privacy policy and terms.'),)
                );
              }
              if (formState.currentState!.validate()) { 
                
               try{
                 await FirebaseAuth.instance.createUserWithEmailAndPassword
                (email: email, password: password);
                
                await auth.currentUser!.sendEmailVerification();
               

                Get.to(()=>  VerifyEmailSreen());} 
                catch(e){
                       ScaffoldMessenger.of(context).showSnackBar(
                         const  SnackBar(backgroundColor: Colors.red,content:  Text( 
                          'this email is invalid or used befor'),)
                );
               }
             
     }},   child:const Text ("Create account"))),
                           const  SizedBox(height: 8), 
                           TextButton(
                    onPressed: () {
                      Get.to(() =>  const  LoginScreen());
                    },
                    child: const Text("Already have account?"))   
             
           ],
         ), 
         
                               
    );
                            
  }
}