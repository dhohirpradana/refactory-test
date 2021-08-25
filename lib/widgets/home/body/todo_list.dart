import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helpers/models/todo_model.dart';
import 'package:todo_app/helpers/provider/todo_provider.dart';
import 'package:todo_app/helpers/state_store.dart';
import 'package:todo_app/utils/app_color.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  Future<void> _displayTextInputDialog(BuildContext context, int id,
      String start, String end, String title) async {
    final TextEditingController _textFieldController = TextEditingController();
    final TextEditingController _start = TextEditingController();
    final TextEditingController _end = TextEditingController();
    _start.text = start;
    _end.text = end;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'UPDATE TODO',
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
                    controller: _textFieldController..text = title,
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
                    controller: _start,
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
                    controller: _end,
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
                    color: Colors.green,
                    textColor: Colors.white,
                    child: const Text('Update'),
                    onPressed: () {
                      Provider.of<TodoProvider>(context, listen: false)
                          .updateTodo(
                              id: id,
                              title: _textFieldController.text,
                              start: _start.text,
                              end: _end.text)
                          .then((v) {
                        _textFieldController.clear();
                        Navigator.pop(context);
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
    return FutureBuilder(
        future: Provider.of<TodoProvider>(context).fetchTodo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final data = context.watch<TodoProvider>().listTodo;
            return SizedBox(
              height: 222.h,
              width: 344.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final datai = data[index];
                  final int id = datai.id;
                  final int uid = datai.uid;
                  final String title =
                      datai.title.substring(1, datai.title.length - 1);
                  final String time =
                      datai.timeStart.toString().substring(12, 14) + ':00';
                  final String isComplete =
                      datai.isComplete.toString().substring(0, 1);

                  return Padding(
                    padding: EdgeInsets.only(top: (index == 0) ? 0 : 34.h),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 106.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12.sp,
                                                color: AppColor.flyingFishBlue),
                                          ),
                                          maxLines: 2,
                                          softWrap: false,
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          datai.timeStart
                                                  .toString()
                                                  .substring(12, 17) +
                                              " - " +
                                              datai.timeEnd
                                                  .toString()
                                                  .substring(12, 17),
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10.sp,
                                                color: AppColor.flyingFishBlue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Align(
                                            alignment:
                                                const Alignment(0.5, 0.3),
                                            child: Material(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Padding(
                                                padding: EdgeInsets.all(11.w),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    // ignore: deprecated_member_use
                                                    FlatButton(
                                                      color: Colors.green,
                                                      textColor: Colors.white,
                                                      child: const Text('Edit'),
                                                      onPressed: () {
                                                        _displayTextInputDialog(
                                                          context,
                                                          datai.id,
                                                          datai.timeStart.substring(
                                                              1,
                                                              datai.timeStart
                                                                      .length -
                                                                  1),
                                                          datai.timeEnd.substring(
                                                              1,
                                                              datai.timeEnd
                                                                      .length -
                                                                  1),
                                                          (datai.title
                                                                      .toString()
                                                                      .length >
                                                                  2)
                                                              ? datai.title
                                                                  .substring(
                                                                      1,
                                                                      datai.title
                                                                              .length -
                                                                          1)
                                                              : "",
                                                        );
                                                      },
                                                    ),
                                                    // ignore: deprecated_member_use
                                                    FlatButton(
                                                      color: Colors.red,
                                                      textColor: Colors.white,
                                                      child:
                                                          const Text('Delete'),
                                                      onPressed: () {
                                                        Provider.of<TodoProvider>(
                                                                context,
                                                                listen: false)
                                                            .deleteTodo(
                                                                id: datai.id)
                                                            .then((v) {
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(Icons.more_vert,
                                        size: 11.sp,
                                        color: AppColor.flyingFishBlue),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: InkWell(
                            onTap: () {
                              final ic = int.parse(isComplete);
                              setState(() {
                                todoDbProvider.updateTodo(
                                    id,
                                    TodoModel(
                                        id,
                                        uid,
                                        datai.title.substring(
                                            1, datai.title.length - 1),
                                        datai.timeStart.substring(
                                            1, datai.timeStart.length - 1),
                                        datai.timeEnd.substring(
                                            1, datai.timeEnd.length - 1),
                                        (ic == 0) ? 1 : 0));
                              });
                            },
                            child: Card(
                              color: (isComplete == "1")
                                  ? AppColor.pinkLemonade
                                  : AppColor.childOfLight,
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
                                        color: (isComplete == "1")
                                            ? AppColor.detailedDevil
                                            : AppColor.angelHairSilver),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "Complete",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10.sp,
                                            color: (isComplete == "1")
                                                ? AppColor.detailedDevil2
                                                : AppColor.angelHairSilver),
                                      ),
                                    )
                                  ],
                                ),
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
            return SizedBox(height: 222.h, width: 344.h, child: const Center());
          }
        });
  }
}
