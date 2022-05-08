import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../pkgs/main.pkg.dart';
import '../values.dart';
import 'button.view.dart';

class DetailsCardView extends StatelessWidget {
  final String title;
  final Map<String, String> items;

  const DetailsCardView({
    required this.title,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return Obx(
      () => Container(
        width: sizeConfig.screenSize.width * 0.67,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [UIColors.primary, UIColors.primary1],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: UIThemeColors.text,
                        ),
                      ),
                      const Gap(5),
                    ] +
                    List.generate(
                      items.length,
                      (index) => Row(
                        children: [
                          Text(
                            items.keys.elementAt(index),
                            style: TextStyle(
                              color: UIThemeColors.text1,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            items.values.elementAt(index),
                            style: TextStyle(
                              color: UIThemeColors.text,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
            CirclerButton(
              child: Icon(
                Icons.read_more,
                color: UIThemeColors.text,
                size: 40,
              ),
              padding: const EdgeInsets.all(15),
              onPressed: () {},
              borderColor: Colors.transparent,
              backgroundColor: Colors.white38,
            ),
          ],
        ),
      ),
    );
  }
}
