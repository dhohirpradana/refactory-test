import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helpers/provider/todo_provider.dart';
import 'package:todo_app/helpers/state_store.dart';
import 'package:todo_app/utils/app_color.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  Future task() async {
    final data = await todoDbProvider.fetchTodo();
    return data.length;
  }

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
                // backgroundImage: const NetworkImage(
                //     'https://picsum.photos/seed/picsum/200/200'),
                child: Icon(
                  Icons.person,
                  size: 30.sp,
                ),
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
                    "Hello, Dhohir Pradana!",
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
                  Row(
                    children: [
                      FutureBuilder(
                          future: Provider.of<TodoProvider>(context).task(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              final data =
                                  context.watch<TodoProvider>().todoToday;
                              return Text(
                                "$data ",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: ScreenUtil().setSp(20),
                                      color: AppColor.brimStone),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }),
                      Text(
                        "Task For Today",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: ScreenUtil().setSp(20),
                              color: AppColor.brimStone),
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
