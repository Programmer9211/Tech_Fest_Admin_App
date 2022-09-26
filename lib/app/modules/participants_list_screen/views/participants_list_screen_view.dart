import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/widgets/particiapants_tile.dart';
import '../controllers/participants_list_screen_controller.dart';

class ParticipantsListScreenView
    extends GetView<ParticipantsListScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFAFAFA),
        title: Text(
          "Participants List",
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
        titleSpacing: 1,
        leadingWidth: 50,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 24,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: GetBuilder<ParticipantsListScreenController>(
          builder: (controller) {
            if (controller.participantsList.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.participantsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      ParticipantsTile(
                        model: controller.participantsList[index],
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text("No registered Participants Available"),
              );
            }
          },
        ),
      ),
    );
  }
}
