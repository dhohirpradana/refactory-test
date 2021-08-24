import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/app_color.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  @override
  Widget build(BuildContext context) {
    var _inputFormat = DateFormat('EE, d MMM yyyy');
    var _now = DateTime.now();
    return Container(
      height: 509.h,
      color: AppColor.paleGrey,
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _inputFormat.format(_now),
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColor.flyingFishBlue),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: SizedBox(
                height: 98.h,
                child: InfiniteListView.separated(
                  scrollDirection: Axis.horizontal,
                  key: const PageStorageKey(0),
                  controller: _infiniteController,
                  itemBuilder: (BuildContext context, int index) {
                    var _date = DateTime.now();
                    _date = DateTime(
                        _date.year, _date.month, _date.day + index + 3);
                    final tanggal = _date.day;
                    final hari =
                        _inputFormat.format(_date).toString().substring(0, 1);
                    return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(right: 9.sp),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              color: AppColor.childOfLight,
                              elevation: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 11.w),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: (_now.day == _date.day &&
                                                  _now.month == _date.month ||
                                              _date.day == _now.day + 3 ||
                                              _date.day == _now.day + 4 ||
                                              _date.day == _now.day + 7)
                                          ? AppColor.monarchWing
                                          : Colors.transparent,
                                      size: 7.sp,
                                    ),
                                    Text(
                                      hari,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: AppColor.blueZephir),
                                      ),
                                    ),
                                    Text(
                                      '$tanggal',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            color: AppColor.propheticSea),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(height: 2.0),
                  anchor: 0.5,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.sp, top: 40.sp),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task List",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: AppColor.extreme),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.sp),
                        child: Column(
                          children: [
                            Text(
                              _now.hour.toString() + ":00",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                    color: AppColor.extreme),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
