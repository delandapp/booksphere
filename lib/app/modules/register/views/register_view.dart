import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';
import 'package:form_validator/form_validator.dart';
import '../../../data/constans/validation.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
        if (!PasswordValidator.isValidPasswordUpper(password: value)) {
          return 'Password must contain at least 1 uppercase letter';
        }
        if (!PasswordValidator.isValidPasswordSymbol(password: value)) {
          return 'Password must contain at least 1 Sysmbol';
        }
        return null;
      });
  ValidationBuilder confirmPassword(TextEditingController controller) {
    return this
      ..add((value) {
        if (value != controller.text.toString()) {
          return 'Passwords do not match';
        }
        return null;
      });
  }
}

final validatorPassword = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters')
    .password()
    .build();
final validator = ValidationBuilder().email().custom().build();

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final heightFullBody = MediaQuery.of(context).size.height;
    final widthFullBody = MediaQuery.of(context).size.width;
    return LoginMobile(
      widthFullBody: widthFullBody,
      heightFullBody: heightFullBody,
      controller: controller,
      isLandscape: isLandscape,
    );
  }
}

class LoginMobile extends StatelessWidget {
  const LoginMobile(
      {super.key,
      required this.widthFullBody,
      required this.heightFullBody,
      required this.controller,
      required this.isLandscape});

  final bool isLandscape;
  final double widthFullBody;
  final double heightFullBody;
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
      width: widthFullBody * 1,
      height: heightFullBody * 1,
      padding: EdgeInsets.only(
          bottom: heightFullBody * 0.02,
          right: widthFullBody * 0.07,
          left: widthFullBody * 0.07),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              width: widthFullBody * 0.55,
              child: FittedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      height: 1.2,
                      fontWeight: FontWeight.w900,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14.0,
                      color: const Color(0xff09142E),
                    ),
                    children: const <TextSpan>[
                      TextSpan(text: 'Welcome \n'),
                      TextSpan(
                        text: 'Let' + "'" + "s ",
                      ),
                      TextSpan(
                          text: 'Sign ',
                          style: TextStyle(color: Color(0xffE84218))),
                      TextSpan(text: 'Up')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widthFullBody * 1,
              child: Text(
                "Digital library application that makes it easy to borrow books",
                textAlign: TextAlign.start,
                style: TextStyle(
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 10.0,
                  color: const Color(0xff09142E),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: heightFullBody * 0.06,
                  bottom: (isLandscape == false ? heightFullBody * 0.03 : 0)),
              child: SizedBox(
                height: heightFullBody * 0.37,
                width: widthFullBody,
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              color: const Color(0xff09142E),
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: heightFullBody * 0.015),
                          child: SizedBox(
                            // height: heightFullBody * 0.07,
                            child: TextFormField(
                                validator: validator,
                                controller: controller.email,
                                autocorrect: false,
                                autofocus: true,
                                enableInteractiveSelection: false,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily),
                                decoration: InputDecoration(
                                  suffixIcon: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.person,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  hintText: 'ryanfahrezi@smk.belajar.id',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 20),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily),
                                  filled: true,
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 255, 17, 0))),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 255, 17, 0))),
                                  fillColor: const Color(0xffF5F5F5),
                                  // border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color: Color(0xff09142E), width: 3)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color: Color(0xff09142E))),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                              color: const Color(0xff09142E),
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: heightFullBody * 0.015),
                          child: SizedBox(
                            // height: heightFullBody * 0.07,
                            child: TextFormField(
                                validator:
                                    ValidationBuilder().minLength(5).build(),
                                controller: controller.username,
                                autocorrect: false,
                                autofocus: true,
                                enableInteractiveSelection: false,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily),
                                decoration: InputDecoration(
                                  suffixIcon: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.envelope,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  hintText: '@RyanFahrezi',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 20),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily),
                                  filled: true,
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 255, 17, 0))),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 255, 17, 0))),
                                  fillColor: const Color(0xffF5F5F5),
                                  // border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color: Color(0xff09142E), width: 3)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color: Color(0xff09142E))),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              color: const Color(0xff09142E),
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: heightFullBody * 0.015,
                          ),
                          child: SizedBox(
                              // height: heightFullBody * 0.07,
                              child: Obx(
                            () => TextFormField(
                                validator: validatorPassword,
                                controller: controller.password,
                                obscureText: controller.isObsure.value,
                                autocorrect: false,
                                autofocus: true,
                                enableInteractiveSelection: false,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily),
                                decoration: InputDecoration(
                                  suffixIcon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.isObsure.value =
                                              !controller.isObsure.value;
                                        },
                                        child: FaIcon(
                                          (controller.isObsure.value) == true
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  hintText: 'Surakarta124@',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 20),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily),
                                  filled: true,
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 255, 17, 0))),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 255, 17, 0))),
                                  fillColor: const Color(0xffF5F5F5),
                                  // border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color: Color(0xff09142E), width: 3)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          widthFullBody * 1),
                                      borderSide: const BorderSide(
                                          color: Color(0xff09142E))),
                                )),
                          )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Checkbox(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xff09142E)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              value: controller.isRemember.value,
                              activeColor: const Color(0xff09142E),
                              onChanged: (newValue) {
                                controller.isRemember.value =
                                    !controller.isRemember.value;
                              },
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Saya menyetujui semua persayaratan dan ",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                            Text(
                              "ketentuan yang berlaku di aplikasi booksphere",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            (isLandscape) == false
                ? ButtonPotrait(
                    controller: controller,
                    widthFullBody: widthFullBody,
                    heightFullBody: heightFullBody)
                : ButtonLandscape(
                    widthFullBody: widthFullBody,
                    heightFullBody: heightFullBody),
            (isLandscape) == false
                ? SizedBox(
                    height: heightFullBody * 0.02,
                  )
                : SizedBox(
                    height: heightFullBody * 0.02,
                  ),
            const Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              width: widthFullBody * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FittedBox(
                    child: Text('Don' + "'" + 't have an account?'),
                  ),
                  FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ButtonPotrait extends StatelessWidget {
  const ButtonPotrait({
    super.key,
    required this.widthFullBody,
    required this.heightFullBody,
    required this.controller,
  });

  final double widthFullBody;
  final double heightFullBody;
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: widthFullBody * 0.85,
              height: heightFullBody * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff09142E),
                    shape: const StadiumBorder()),
                onPressed: () {
                  controller.postRegister();
                },
                child: controller.loading.value
                    ? CircularProgressIndicator()
                    : Text(
                        "Sign In",
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w900),
                      ),
              ),
            ),
            SizedBox(
              height: heightFullBody * 0.02,
            ),
            SizedBox(
              width: widthFullBody * 0.85,
              height: heightFullBody * 0.06,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xff09142E)),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: const StadiumBorder()),
                onPressed: () {
                  Get.offAllNamed(Routes.HOME);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.orange,
                ),
                label: Text(
                  "Sign in with google",
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ));
  }
}

class ButtonLandscape extends StatelessWidget {
  const ButtonLandscape({
    super.key,
    required this.widthFullBody,
    required this.heightFullBody,
  });

  final double widthFullBody;
  final double heightFullBody;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: widthFullBody * 0.4,
          height: heightFullBody * 0.07,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff09142E),
                shape: const StadiumBorder()),
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Text(
              "Sign In",
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(
          height: heightFullBody * 0.02,
        ),
        SizedBox(
          width: widthFullBody * 0.4,
          height: heightFullBody * 0.07,
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xff09142E)),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: const StadiumBorder()),
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.orange,
            ),
            label: Text(
              "Sign in with google",
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
