import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:xinner/utils/constants/my_constants.dart';
import 'package:xinner/widgets/button_widget.dart';
import 'package:xinner/widgets/custom_text_field_widget.dart';

class RefuseAppointementDialog extends StatelessWidget {
  RefuseAppointementDialog({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String text = "";
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CustomDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              "Write the reason for refusing this appointement",
              // textAlign: TextAlign.center,
              style: TextStyle(
                // height: 1.5,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 17,
            ),
            CustomTextField(
              hintText: "reason is ...",
              maxLines: 6,
              onSaved: (val) {
                text = val!;
              },
            ),
            SizedBox(
              height: 17,
            ),
            Button(
              text: "Confirm",
              backGroundColor: Colors.green,
              onTap: () {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  Get.back(result: text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: kPrimaryColor.withOpacity(.4),
                    blurRadius: 8,
                    spreadRadius: 5)
              ],
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: child));
  }
}
