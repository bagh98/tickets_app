import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickets_app/base/res/styles/app_style.dart';
import 'package:tickets_app/base/utils/all_json.dart';

import '../controller/text_expansion_controller.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({
    super.key,
  });

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var route = ModalRoute.of(context);
    if (route != null && route.settings.arguments is Map) {
      var args = route.settings.arguments as Map;
      index = args["index"];
    } else {
      // Handle the error case
      // For example, you might want to navigate back or show a message
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppStyles.bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/${hotelList[index]["image"]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      color: Colors.black.withOpacity(0.3),
                      child: Text(
                        hotelList[index]["place"],
                        style: TextStyle(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                blurRadius: 10.0,
                                color: AppStyles.primaryColor,
                                offset: Offset(2.0, 2.0))
                          ],
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ExpandedTextWidget(
                      text: hotelList[index]["detial"],
                    )
                    //  Text(
                    //   hotelList[index]["detial"],
                    // ),
                    ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "More images ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        hotelList[index]["images"].length, // Fixed typo here
                    itemBuilder: (context, imagesIndex) {
                      return Container(
                        margin: const EdgeInsets.all(16.0),
                        color: Colors.red,
                        child: Image.asset(
                          "assets/images/${hotelList[index]["images"][imagesIndex]}",
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandedTextWidget extends StatelessWidget {
  ExpandedTextWidget({super.key, required this.text});
  final String text;

  final TextExpansionController controller = Get.put(TextExpansionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var textWidget = Text(
        text,
        maxLines: controller.isExpanded.value ? null : 3,
        overflow: controller.isExpanded.value
            ? TextOverflow.visible
            : TextOverflow.ellipsis,
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget,
          GestureDetector(
            onTap: () {
              controller.toggleExpansion();
            },
            child: Text(
              controller.isExpanded.value ? 'less' : "more",
              style:
                  AppStyles.textStyle.copyWith(color: AppStyles.primaryColor),
            ),
          )
        ],
      );
    });
  }
}
