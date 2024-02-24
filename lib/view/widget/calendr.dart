import 'package:e_store/controller/add_appoint/calender_controller.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalender extends StatelessWidget {
  const MyCalender({super.key, this.onDaySelected, required this.focusedDay});

  final Function(DateTime, DateTime)? onDaySelected;
  final DateTime focusedDay;
  @override
  Widget build(BuildContext context) {
     Get.put(CalenderControllerImp());
    DateTime today = DateTime.now();
    DateTime next7Days = today.add(const Duration(days: 6));
    return  TableCalendar(
                calendarFormat: CalendarFormat.week,
                focusedDay: focusedDay,
                firstDay: today,
                lastDay: next7Days,
                selectedDayPredicate: (day) => isSameDay(day, focusedDay),
                availableCalendarFormats: const {CalendarFormat.week: 'Week'},
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: kOnBoardingP,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 131, 250, 135),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: true,
                ),
                onDaySelected: onDaySelected
              );
           
  }
}