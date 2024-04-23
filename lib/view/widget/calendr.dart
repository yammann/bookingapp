
import 'package:e_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalender extends StatelessWidget {
  const MyCalender(
      {super.key,
      this.onDaySelected,
      required this.focusedDay,
      required this.endDay, 
      required this.availableCalendarFormats, 
      required this.calendarFormat, 
      required this.holidays});

  final Function(DateTime, DateTime)? onDaySelected;
  final DateTime focusedDay;
  final DateTime endDay;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final CalendarFormat calendarFormat;
  final List<dynamic> holidays;
  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    return  TableCalendar( 
      locale:"calenderLocal".tr ,
      holidayPredicate: (day) {
        bool isHoliday=false;
       for(int holiday in holidays){
        if(day.weekday==holiday){
          isHoliday= true;
          break;
        }
       }
       return isHoliday;
      },
      daysOfWeekHeight: 40,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarFormat: calendarFormat,
        focusedDay: focusedDay,
        firstDay: today,
        lastDay: endDay,
        selectedDayPredicate: (day) => isSameDay(day, focusedDay),
        availableCalendarFormats: availableCalendarFormats,
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
        onDaySelected: onDaySelected);
  }
}
