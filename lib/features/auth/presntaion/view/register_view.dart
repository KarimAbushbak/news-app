import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:news/core/resources/manager_colors.dart';
import 'package:news/core/resources/manager_font_sizes.dart';
import 'package:news/core/resources/manager_font_weight.dart';
import 'package:news/core/resources/manager_height.dart';
import 'package:news/core/resources/manager_width.dart';

import '../../../../routes/routes.dart';
import '../controller/auth_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        "Hello!",
                        style: TextStyle(
                            color: ManagerColors.blue,
                            fontSize: ManagerFontSizes.s48,
                            fontWeight: ManagerFontWeight.bold),
                      ),
                    ),
                    Text(
                      "Sign Up to Get Started",
                      style: TextStyle(
                          color: ManagerColors.gray,
                          fontSize: ManagerFontSizes.s20,
                          fontWeight: ManagerFontWeight.w400),
                    ),
                    SizedBox(
                      height: ManagerHeight.h48,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          color: ManagerColors.primaryColor,
                          fontSize: ManagerFontSizes.s16,
                          fontWeight: ManagerFontWeight.w400),
                    ),
                    SizedBox(
                      height: ManagerHeight.h8,
                    ),
                    Container(
                      width: double.infinity,
                      height: ManagerHeight.h70,
                      child: TextField(
                        controller: controller.emailController,
                        cursorColor: ManagerColors.primaryColor,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey), // 🖤 Black border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey), // 🖤 Black border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1), // 🖤 Optional: thicker border
                          ),
                          filled: true,
                          fillColor: ManagerColors.textFieldColor,
                          hintText: "Enter Email",
                          labelStyle: TextStyle(color: ManagerColors.gray),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h16,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          color: ManagerColors.primaryColor,
                          fontSize: ManagerFontSizes.s16,
                          fontWeight: ManagerFontWeight.w400),
                    ),
                    SizedBox(
                      height: ManagerHeight.h8,
                    ),
                    Container(
                      width: double.infinity,
                      height: ManagerHeight.h70,
                      child: TextField(
                        controller: controller.passwordController,
                        cursorColor: ManagerColors.primaryColor,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey), // 🖤 Black border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey), // 🖤 Black border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ), // 🖤 Optional: thicker border
                          ),
                          filled: true,
                          fillColor: ManagerColors.textFieldColor,
                          hintText: "Enter password",
                          labelStyle: TextStyle(color: ManagerColors.gray),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h8,
                    ),
                    SizedBox(
                      height: ManagerHeight.h8,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.changeValue();
                          },
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: controller.checkboxValue ? Colors.blue : Colors.white,
                              border: Border.all(
                                color: controller.checkboxValue?Colors.blue:Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: controller.checkboxValue
                                ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text("Remember me"),

                      ],
                    ),
                    SizedBox(
                      height: ManagerHeight.h16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.signUp(controller.emailController.text.trim(), controller.passwordController.text.trim());


                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ManagerColors.blue,
                        elevation: 0,
                        minimumSize: Size(
                          ManagerWidth.w380,
                          ManagerHeight.h50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                              color: ManagerColors.blue,
                              width: 2),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: ManagerColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an Account",
                          style: TextStyle(
                              fontSize: ManagerFontSizes.s16,
                              fontWeight: ManagerFontWeight.w400),
                        ),
                        GestureDetector(
                          onTap:(){
                            Get.offAllNamed(Routes.loginView);

                          } ,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: ManagerFontSizes.s16,
                                fontWeight: ManagerFontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    )


                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
