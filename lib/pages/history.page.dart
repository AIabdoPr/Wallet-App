import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/history.model.dart';
import '../values.dart';
import 'page.dart' as page;

class HistoryPage extends page.Page {
  static const String routeName = "/home/history";

  HistoryPage({Key? key}) : super(key: key);

  @override
  void setPageHeaders(page.PageHeaders pageHeaders) {
    pageHeaders.transition = Transition.size;
    pageHeaders.curve = Curves.easeIn;
    pageHeaders.transitionDuration = const Duration(milliseconds: 300);
    super.setPageHeaders(pageHeaders);
  }

  @override
  Widget buildBody(BuildContext context) {
    HistoryModel history =
        ModalRoute.of(context)!.settings.arguments as HistoryModel;
    Map<String, String> items = {
      "Id": history.id.toString(),
      "From": history.user.username,
      "To": history.target.username,
      "On Date": DateFormat("yyyy-mm-dd").format(history.createdAt),
      "Action": history.action.mode,
    };
    return Obx(
      () => Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(60),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: UIThemeColors.iconBg,
                ),
              ),
            ),
          ),
          const Gap(40),
          Text(
            "History Details",
            style: TextStyle(
              color: UIThemeColors.text,
              fontSize: 36,
              fontFamily: Consts.fontFamily,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(15),
          Flexible(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                String key = items.keys.elementAt(index);
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: UIThemeColors.fieldBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        "$key: ",
                        style: TextStyle(
                          color: UIThemeColors.text,
                          fontFamily: Consts.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        items[key]!,
                        style: TextStyle(
                          color: UIThemeColors.text1,
                          fontFamily: Consts.fontFamily,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
