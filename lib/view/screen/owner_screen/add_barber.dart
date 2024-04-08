import 'package:e_store/controller/add_barber_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/core/function/validat.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:e_store/view/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBarber extends StatelessWidget {
  AddBarber({super.key});
  final AddBarberControllerImp addBarberControllerImp =Get.put(AddBarberControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      appBar: AppBar(
        backgroundColor: kOnBoardingBG,
        centerTitle: true,
        title:  Text("Add Barber"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child:GetBuilder<AddBarberControllerImp>(
          init: AddBarberControllerImp(),
          builder: (controller) {
            return Form(
            key: controller.formKey,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        AuthTextFiled(
                          myController: controller.userNameController,
                          valid: (val) {
                            return validation(val, 5, 50, Type.userName);
                          },
                          keyboardType: TextInputType.name,
                          label: "userNameLabel".tr,
                          hint: "userNameHint".tr,
                          icon: const Icon(
                            Icons.person_3_outlined,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFiled(
                          myController: controller.emailController,
                          valid: (val) {
                            return validation(val, 5, 50, Type.email);
                          },
                          keyboardType: TextInputType.emailAddress,
                          label: "EmailLabel".tr,
                          hint: "EmailHint".tr,
                          icon: const Icon(Icons.email_outlined),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFiled(
                          myController: controller.phoneNumberController,
                          valid: (val) {
                            return validation(val, 5, 15, Type.phoneNumber);
                          },
                          inputFormatters: [controller.phoneNumberFormatter],
                          keyboardType: TextInputType.phone,
                          label: "phoneLabel".tr,
                          hint: "phoneHint".tr,
                          icon: const Icon(
                            Icons.phone_enabled_outlined,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFiled(
                          myController: controller.passwordController,
                          valid: (val) {
                            return validation(val, 5, 50, Type.passowrd);
                          },
                          isObscure: controller.obscure,
                          label: "PasswordLabel".tr,
                          hint: "PasswordHint".tr,
                          icon: IconButton(
                              onPressed: () {
                                controller.obsure();
                              },
                              icon: controller.obscure
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppButton(
                          onTap: () {
                            controller.addBarber();
                          },
                          title: "Add",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
          },)
      ),
    );
  }
}
