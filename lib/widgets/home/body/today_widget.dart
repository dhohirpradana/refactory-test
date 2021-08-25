import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/app_color.dart';

class TodayWidget extends StatelessWidget {
  final DateFormat dateFormat;
  final DateTime now;
  const TodayWidget({Key? key, required this.dateFormat, required this.now})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            dateFormat.format(now),
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: AppColor.flyingFishBlue),
            ),
          ),
        ],
      ),
    );
  }
}
