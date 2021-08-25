import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helpers/google.dart';
import 'package:todo_app/helpers/provider/todo_provider.dart';
import 'package:todo_app/utils/app_color.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _start = TextEditingController();
  final TextEditingController _end = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'ADD TODO',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: AppColor.extreme),
              ),
            ),
            content: SizedBox(
              height: 170.h,
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {},
                    controller: _textFieldController,
                    decoration: const InputDecoration(hintText: "Title"),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "time",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 10.sp),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Start",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'd MM, yyyy',
                    // initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    controller: _start..text = DateTime.now().toString(),
                    lastDate: DateTime(2100),
                    icon: const Icon(Icons.event),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    selectableDayPredicate: (date) {
                      // Disable weekend days to select from the calendar
                      if (date.weekday == 6 || date.weekday == 7) {
                        return false;
                      }

                      return true;
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        "End",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'd MM, yyyy',
                    // initialValue: DateTime.now().toString(),
                    controller: _end..text = DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: const Icon(Icons.event),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    selectableDayPredicate: (date) {
                      // Disable weekend days to select from the calendar
                      if (date.weekday == 6 || date.weekday == 7) {
                        return false;
                      }

                      return true;
                    },
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    color: AppColor.flyingFishBlue,
                    textColor: Colors.white,
                    child: const Text('Save'),
                    onPressed: () {
                      Provider.of<TodoProvider>(context, listen: false)
                          .addTodo(
                              title: _textFieldController.text,
                              start: _start.text,
                              end: _end.text)
                          .then((v) {
                        _textFieldController.clear();
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 83.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.list, size: 20.sp, color: AppColor.flyingFishBlue),
              SizedBox(height: 10.h),
              Text(
                "Task",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: AppColor.flyingFishBlue),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              _displayTextInputDialog(context);
            },
            child: Container(
              height: 52.w,
              width: 52.w,
              decoration: BoxDecoration(
                  color: AppColor.flyingFishBlue,
                  borderRadius: BorderRadius.circular(15.sp)),
              child: Icon(Icons.add, color: Colors.white, size: 30.sp),
            ),
          ),
          InkWell(
            onTap: () {
              Authentication.signOut(context: context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings, size: 20.sp, color: AppColor.propheticSea),
                SizedBox(height: 10.h),
                Text(
                  "Setting",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                        color: AppColor.propheticSea),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
