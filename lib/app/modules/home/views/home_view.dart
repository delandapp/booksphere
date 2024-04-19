import 'package:booksphere/app/components/buildSection.dart';
import 'package:booksphere/app/components/navProfil.dart';
import 'package:booksphere/app/data/constans/constans.dart';
import 'package:booksphere/app/data/constans/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // width: widthFullBody,
        child: controller.obx(
          (state) => SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  navProfil(
                    title: controller.username.value.toString(),
                    image: "assets/profil.png",
                    icon: FontAwesomeIcons.bell,
                    subtitle: controller.sapaanBerdasarkanWaktu(),
                  ),
                  SizedBox(height: heightFullBody * 0.04,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.04),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          height: 1.2,
                          fontWeight: FontWeight.w900,
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                  .fontFamily,
                          fontSize: 45.0,
                          color: const Color(0xff09142E),
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'Find Your \n'),
                          TextSpan(
                              text: 'Favorit ',
                              style: TextStyle(color: Color(0xffE84218))),
                          TextSpan(
                            text: 'Book',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: heightFullBody * 0.04,),
                  SizedBox(
                    width: widthFullBody,
                    height: heightFullBody * 0.25,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        controller.currentPage.value = value;
                      },
                      itemCount: controller.splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                        title: controller.splashData[index]['title'],
                        image: controller.splashData[index]["image"],
                        text: controller.splashData[index]['text'],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            controller.splashData.length,
                            (index) => Obx(
                                  () => AnimatedContainer(
                                    duration: kAnimationDuration,
                                    margin: const EdgeInsets.only(right: 5),
                                    height: 6,
                                    width: controller.currentPage.value == index
                                        ? 20
                                        : 6,
                                    decoration: BoxDecoration(
                                      color: controller.currentPage.value == index
                                          ? kPrimaryColor
                                          : Color.fromARGB(255, 113, 113, 113),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                )),
                      ),
                    ]),
                  ),
                  Column(
                    children: state!.map((data) {
                      return SizedBox(
                        height: heightFullBody * 0.3,
                        child: buildSection(data: data),
                      );
                    }).toList(),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}
