import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:retro_portal/custom/BorderIcon.dart';
import 'package:retro_portal/custom/OptionButton.dart';
import 'package:retro_portal/sample_data.dart';
import 'package:retro_portal/utils/constants.dart';
import 'package:retro_portal/utils/custom_functions.dart';
import 'package:retro_portal/utils/widget_functions.dart';
import 'package:retro_portal/sample_data.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    final sidepadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderIcon(
                          height: 50,
                          width: 50,
                          child: const Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                        BorderIcon(
                          height: 50,
                          width: 50,
                          child: const Icon(
                            Icons.settings,
                            color: COLOR_BLACK,
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidepadding,
                    child: Text(
                      'city',
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  Padding(
                    padding: sidepadding,
                    child: Text(
                      'Sans Fransico',
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: sidepadding,
                    child: Divider(
                      color: COLOR_GREY,
                      height: padding,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      ...["<20000", "for sale", "2-5 beds", ">1000sqft"]
                          .map((filter) => ChoiceOption(text: filter))
                          .toList()
                    ]),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidepadding,
                      child: ListView.builder(
                        itemCount: RE_DATA.length,
                        itemBuilder: ((context, index) {
                          return Cards(itemData: RE_DATA[index]);
                        }),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 15,
                  right: 15,
                  width: size.width,
                  child: Center(
                    child: OptionButton(
                      icon: Icons.map_rounded,
                      width: size.width * 0.40,
                      text: "Map View",
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;
  const ChoiceOption({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final dynamic itemData;

  const Cards({super.key, required this.itemData});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image(
                  image: AssetImage(itemData["image"]),
                )),
            Positioned(
              top: 15,
              right: 15,
              child: BorderIcon(
                width: 50,
                height: 50,
                child: const Icon(
                  Icons.favorite_border,
                  color: COLOR_BLACK,
                ),
              ),
            ),
          ],
        ),
        addVerticalSpace(15),
        Row(
          children: [
            Text("${formatCurrency(itemData["amount"])}",
                style: themeData.textTheme.headline1),
            addHorizontalSpace(10),
            Text("${itemData["address"]}",
                style: themeData.textTheme.bodyText2),
          ],
        ),
        addVerticalSpace(4),
        Text(
          "${itemData['address']} bedrooms / ${itemData['bathrooms']}",
          style: themeData.textTheme.headline5,
        )
      ]),
    );
  }
}
