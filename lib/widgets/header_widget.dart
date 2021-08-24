import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/app_color.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 108.h,
      color: AppColor.flyingFishBlue,
      child: Padding(
        padding: EdgeInsets.only(left: 18.w, top: 37.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: CircleAvatar(
                radius: 28.sp,
                backgroundImage: const NetworkImage(
                    'https://picsum.photos/seed/picsum/200/300'),
                foregroundColor: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, Sam!",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 6.sp,
                  ),
                  Text(
                    "2 Task For Today",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: ScreenUtil().setSp(20),
                          color: AppColor.brimStone),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
