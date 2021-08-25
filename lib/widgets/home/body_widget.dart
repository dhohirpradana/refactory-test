import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/helpers/models/todo_model.dart';
import 'package:todo_app/helpers/state_store.dart';
import 'package:todo_app/utils/app_color.dart';
import 'package:todo_app/widgets/home/body/todo_list.dart';
import 'package:todo_app/widgets/home/bottom_nav_bar/bottom_navigation_widget.dart';
import 'body/date_card_widget.dart';
import 'body/today_widget.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  Future<void> addTodo() async {
    var _now = DateTime.now();
    var _cDate = DateTime(2021, 08, 25, 11, 30);
    await todoDbProvider.addTodo(TodoModel(
      _now.millisecondsSinceEpoch,
      1,
      "Sudah saatnya",
      _now.toString(),
      _cDate.toString(),
      0,
    ));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // addTodo();
  }

  @override
  Widget build(BuildContext context) {
    var _dateFormat = DateFormat('EE, d MMM yyyy');
    var _now = DateTime.now();
    return Container(
      height: 532.h,
      color: AppColor.paleGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TodayWidget(
            dateFormat: _dateFormat,
            now: _now,
          ),
          DateCardWidget(
            dateFormat: _dateFormat,
            now: _now,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.sp, top: 40.h),
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
                    SizedBox(
                      height: 20.h,
                    ),
                    const TodoListWidget(),
                  ],
                ),
              ],
            ),
          ),
          const BottomNavBarWidget(),
        ],
      ),
    );
  }
}
