import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio_x/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameWidget = "Nouhe ben\nNaser."
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 12 : 18)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
              child: VStack([
        ZStack(
          [
            PictureWidget(),
            Row(
              children: [
                VStack([
                  if (context.isMobile) 50.heightBox else 10.heightBox,
                  CustomAppBar().shimmer(primaryColor: Coolors.accentColor),
                  30.heightBox,
                  nameWidget,
                  20.heightBox,
                  VxBox()
                      .color(Coolors.accentColor)
                      .size(60, 10)
                      .make()
                      .px4()
                      .shimmer(primaryColor: Coolors.accentColor),
                  30.heightBox,
                  SocialAccounts(),
                ]).pSymmetric(
                  h: context.percentWidth * 10,
                  v: 32,
                ),
                Expanded(
                  child: VxResponsive(
                    medium: IntroductionWidget()
                        .pOnly(left: 120)
                        .h(context.percentHeight * 60),
                    large: IntroductionWidget()
                        .pOnly(left: 120)
                        .h(context.percentHeight * 60),
                    fallback: const Offstage(),
                  ),
                )
              ],
            ).w(context.screenWidth)
          ],
        )
      ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolors.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          " - Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "3BI student at IHEC Carthage. Passionate about coding, problem-solving, and building impactful digital solutions."
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        ElevatedButton(
          onPressed: () {
            launch("https://www.linkedin.com/in/nouha-ben-nasr-a88632259");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Coolors.accentColor,
            foregroundColor: Coolors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: "Visit My linkedin Account !".text.make(),
        ).h(50)
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.code, // Changed to MaterialIcons
      size: 50,
      color: Coolors.accentColor,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      origin: Offset(context.percentWidth * 2, 0),
      transform: Matrix4.rotationY(pi),
      child: Image.asset(
        "assets/pic.png",
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
      ),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.alternate_email, // Changed to MaterialIcons
          color: Colors.white,
        ).mdClick(() {
          launch("mailto:nouhebennaser@gmail.com");
        }).make(),
        20.widthBox,
        SocialMediaButton.linkedin(
          url: "https://www.linkedin.com/in/nouha-ben-nasr-a88632259/",
          size: 30,
          color: Colors.white,
        ),
        20.widthBox,
        SocialMediaButton.instagram(
          url: "https://www.instagram.com/nouhe.bennasr/",
          size: 30,
          color: Colors.white,
        ),
        20.widthBox,
        SocialMediaButton.github(
          url: "https://github.com/nouhebennasr", // Replace with your GitHub
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
