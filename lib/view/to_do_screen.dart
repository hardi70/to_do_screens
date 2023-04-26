import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_screens/res/common/Textfiled.dart';
import 'package:to_do_screens/res/common/app_button.dart';
import 'package:to_do_screens/res/common/continer_common.dart';
import 'package:to_do_screens/res/constant/app_string.dart';

import '../modal/to_do_modal.dart';

class AddToDoScreen extends StatefulWidget {
  final List<ToDoModel>? toDoList;
  final int? index;
  const AddToDoScreen({
    Key? key,
    this.toDoList,
    this.index,
  }) : super(key: key);

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  bool? dateIsSelect = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  bool? timeIsSelect = false;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    debugPrint("picked ---->> $selectedDate");
    debugPrint("picked ---->> $picked");

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateIsSelect = true;
      setState(() {});
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    debugPrint("picked ---->> $selectedTime");
    debugPrint("picked ---->> $picked");

    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      timeIsSelect = true;
      setState(() {});
    }
  }

  List<ToDoModel> toDoList = [];
  @override
  void initState() {
    toDoList = widget.toDoList!;
    if (widget.index != null) {
      titleController.text = toDoList[widget.index!].title!;
      desController.text = toDoList[widget.index!].des!;
      selectedDate = DateFormat('d/M/y').parse(toDoList[widget.index!].date!);
      dateIsSelect = true;
      var hour =
          toDoList[widget.index!].time!.split(" ").first.split(":").first;
      var minute = toDoList[widget.index!].time!.split(" ").first.split(":")[1];
      selectedTime =
          TimeOfDay(hour: int.parse(hour), minute: int.parse(minute));
      timeIsSelect = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/to_do_screens.png"),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset("assets/images/to_do_image.png"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 170),
                child: Text(
                  "Bem-vinda, Camila!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: [
                  AppTextField(
                    controller: titleController,
                    hintText: AppStings.enterTitle,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => selectDate(context),
                        child: AppContainer(
                          icon: Icons.date_range,
                          hintText: dateIsSelect!
                              ? DateFormat.yMd().format(selectedDate)
                              : "Select Date",
                          isData: dateIsSelect!,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () => selectTime(context),
                        child: AppContainer(
                          icon: Icons.timelapse,
                          hintText: timeIsSelect!
                              ? selectedTime.format(context)
                              : "Select Time",
                          isData: timeIsSelect!,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    controller: desController,
                    hintText: AppStings.enterDescription,
                    isDes: true,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      if (widget.index != null) {
                        toDoList[widget.index!] = ToDoModel(
                          title: titleController.text,
                          date: DateFormat.yMd().format(selectedDate),
                          time: selectedTime.format(context),
                          des: desController.text,
                        );
                      } else {
                        toDoList.add(
                          ToDoModel(
                            title: titleController.text,
                            date: DateFormat.yMd().format(selectedDate),
                            time: selectedTime.format(context),
                            des: desController.text,
                          ),
                        );
                      }
                      Navigator.pop(context, toDoList);
                    },
                    child: const AppButton(
                      width: 150,
                      title: AppStings.addToDo,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
