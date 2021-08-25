import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/app_color.dart';

class DateCardWidget extends StatelessWidget {
  final DateFormat dateFormat;
  final DateTime now;
  const DateCardWidget({Key? key, required this.dateFormat, required this.now})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InfiniteScrollController _infiniteController =
        InfiniteScrollController(
      initialScrollOffset: 0.0,
    );
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: SizedBox(
        height: 98.h,
        child: InfiniteListView.separated(
          scrollDirection: Axis.horizontal,
          key: const PageStorageKey(0),
          controller: _infiniteController,
          itemBuilder: (BuildContext context, int index) {
            var _date = DateTime.now();
            _date = DateTime(_date.year, _date.month, _date.day + index);
            final tanggal = _date.day;
            final hari = dateFormat.format(_date).toString().substring(0, 1);
            return InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: 9.sp),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      color: (now.day == _date.day &&
                              now.month == _date.month &&
                              now.year == _date.year)
                          ? AppColor.flyingFishBlue
                          : AppColor.childOfLight,
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.circle,
                              color: (now.day == _date.day &&
                                          now.month == _date.month ||
                                      _date.day == now.day + 3 ||
                                      _date.day == now.day + 4 ||
                                      _date.day == now.day + 7)
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
                                    color: (now.day == _date.day &&
                                            now.month == _date.month)
                                        ? Colors.white
                                        : AppColor.blueZephir),
                              ),
                            ),
                            Text(
                              '$tanggal',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: (now.day == _date.day &&
                                            now.month == _date.month)
                                        ? Colors.white
                                        : AppColor.propheticSea),
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
    );
  }
}
