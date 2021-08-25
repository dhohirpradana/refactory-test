import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/helpers/state_store.dart';
import 'package:todo_app/utils/app_color.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: todoDbProvider.fetchTodo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return SizedBox(
              height: 300.h,
              width: 344.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final datai = data[index];
                  final String title =
                      datai.title.substring(1, datai.title.length - 1);
                  final String time =
                      datai.start.toString().substring(12, 14) + ':00';
                  return Padding(
                    padding: EdgeInsets.only(top: (index != 0) ? 34.h : 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            time,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  color: AppColor.extreme),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 57.w),
                          child: Card(
                            elevation: 0,
                            color: AppColor.cloudless,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 8.w,
                                  top: 8.h,
                                  bottom: 12.h,
                                  right: 7.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12.sp,
                                              color: AppColor.flyingFishBlue),
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        time,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10.sp,
                                              color: AppColor.flyingFishBlue),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.w),
                                  Icon(
                                    Icons.more_vert,
                                    size: 11.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Card(
                            color: AppColor.pinkLemonade,
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 12.w,
                                  top: 8.h,
                                  bottom: 11.h,
                                  right: 12.w),
                              child: Row(
                                children: [
                                  Icon(Icons.check,
                                      size: 11.h,
                                      color: AppColor.detailedDevil),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "Complete",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: AppColor.detailedDevil2),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
