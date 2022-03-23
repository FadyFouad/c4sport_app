import 'dart:math';

import 'package:c4sport_app/ui/widgets/app_bar.dart';
import 'package:c4sport_app/ui/widgets/app_drawer.dart';
import 'package:c4sport_app/ui/widgets/rounded_button.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:c4sport_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../widgets/drop_down.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/17/2022 at 12:22 PM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  // List<CalendarView> _allowedViews = [];
  List<String> _subjectCollection = [];

  // List<Color> _colorCollection = [];
  List<Appointment> _shiftCollection = [];
  List<CalendarResource> _employeeCollection = [];
  List<TimeRegion> _specialTimeRegions = [];

  List<String> _nameCollection = [];

  // List<String> _userImages = [];
  _DataSource? _events;

  @override
  void initState() {
    _shiftCollection = <Appointment>[];
    _employeeCollection = <CalendarResource>[];
    _specialTimeRegions = <TimeRegion>[];
    // _userImages = <String>[];
    _addResourceDetails();
    _addResources();
    // _addSpecialRegions();
    _addAppointmentDetails();
    _addAppointments();
    _events = _DataSource(_shiftCollection, _employeeCollection);
    // _allowedViews = <CalendarView>[
    //   CalendarView.timelineDay,
    //   CalendarView.timelineWeek,
    //   CalendarView.timelineWorkWeek,
    //   CalendarView.timelineMonth,
    // ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomAppBar(
          bottom: Text('search Here'),
          actions: [],
        ),
        drawer: const AppDrawer(),
        body: SafeArea(
          child: Flexible(
            flex: 9,
            child: SfCalendar(
                view: CalendarView.day,
                showDatePickerButton: false,
                showCurrentTimeIndicator: true,
                showWeekNumber: false,
                allowAppointmentResize: true,
                showNavigationArrow: true,
                allowDragAndDrop: true,
                allowViewNavigation: true,
                timeSlotViewSettings: const TimeSlotViewSettings(
                  timeIntervalHeight: 60,
                  timeIntervalWidth: 80,
                  timeTextStyle: normalTextStyle_500,
                  allDayPanelColor: primaryColor,
                  // timeRulerSize: 100,
                ),
                specialRegions: _specialTimeRegions,
                dataSource: _events,
                dragAndDropSettings: const DragAndDropSettings(
                  allowNavigation: true,
                  allowScroll: true,
                  autoNavigateDelay: Duration(seconds: 1),
                  indicatorTimeFormat: 'HH:mm a',
                  showTimeIndicator: true,
                ),
                onDragStart: (AppointmentDragStartDetails details) {
                  // dynamic appointment = details.appointment!;
                  // CalendarResource? resource = details.resource;
                  Get.snackbar('Start', 'You Started Drag');
                },
                onDragEnd: (AppointmentDragEndDetails details) {
                  // dynamic appointment = details.appointment!;
                  // CalendarResource? sourceResource = details.sourceResource;
                  // CalendarResource? targetResource = details.targetResource;
                  // DateTime? draggingTime = details.droppingTime;
                  Get.snackbar('End', 'End of the Drag');
                },
                // scheduleViewMonthHeaderBuilder: (BuildContext buildContext,
                //     ScheduleViewMonthHeaderDetails details) {
                //   return Container(
                //     color: Colors.red,
                //     child: Text(
                //       details.date.month.toString() +
                //           'iiii' +
                //           details.date.year.toString(),
                //     ),
                //   );
                // },
                todayTextStyle: const TextStyle(color: whiteColor),
                todayHighlightColor: accentColor,
                viewHeaderHeight: 0,
                backgroundColor: whiteColor,
                headerHeight: 50,
                headerStyle: const CalendarHeaderStyle(
                    backgroundColor: primaryColor,
                    textStyle: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                headerDateFormat: 'dd MMMM yyyy',
                firstDayOfWeek: 1,
                resourceViewHeaderBuilder:
                    (BuildContext context, ResourceViewHeaderDetails details) {
                  // if (details.resource.image != null) {
                  return Text(details.resource.displayName);
                },
                resourceViewSettings: const ResourceViewSettings(showAvatar: false),
                viewHeaderStyle: const ViewHeaderStyle(
                    dateTextStyle: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    // backgroundColor: primaryColor,
                    dayTextStyle: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0)),
                weekNumberStyle:
                    const WeekNumberStyle(backgroundColor: accentColor),
                appointmentTextStyle: const TextStyle(color: accentColor),
                appointmentTimeTextFormat: 'HH:MM',
                timeRegionBuilder: (BuildContext context,
                    TimeRegionDetails timeRegionDetails) {
                  return Container(
                    margin: const EdgeInsets.all(1),
                    alignment: Alignment.center,
                    child: Text(
                      timeRegionDetails.region.text!,
                      style: const TextStyle(color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                        gradient: LinearGradient(
                            colors: [
                              timeRegionDetails.region.color!,
                              Colors.cyan
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft)),
                  );
                },
                selectionDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: const Color.fromARGB(255, 68, 140, 255), width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  shape: BoxShape.rectangle,
                ),


                scheduleViewSettings:
                    const ScheduleViewSettings(appointmentItemHeight: 500),
                cellBorderColor: Colors.grey,
                viewNavigationMode: ViewNavigationMode.snap,
                onViewChanged: (ViewChangedDetails details) {},
                appointmentBuilder: (BuildContext context,
                    CalendarAppointmentDetails calendarAppointmentDetails) {
                  // if (calendarAppointmentDetails.isMoreAppointmentRegion) {
                  final Appointment appointment =
                      calendarAppointmentDetails.appointments.first;

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: accentColor),
                        borderRadius: BorderRadius.circular(10.0),
                        color: whiteColor,
                      ),
                      child: Column(
                        children: [
                          // Training Buddy
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("Training Buddy",
                                style: TextStyle(
                                    color: accentColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "SegoeUI",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0),
                                textAlign: TextAlign.left),
                          ),
                          // Cycling Training Buddy with Ahmed Ali
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "SegoeUI",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0),
                                text: '${appointment.subject} with '),
                            const TextSpan(
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "SegoeUI",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0),
                                text: "Ahmed Ali"),
                          ])),
                          const Expanded(child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(color: accentColor, width: 1),
                                ),
                                child: SizedBox(
                                    height: 28,
                                    child: RoundedCornerButton(
                                      miniWidth: width,
                                      text: 'text',
                                      onTap: () {},
                                      fontSize: 6,
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: whiteColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  builder: (_) {
                    return SizedBox(
                      height: height * .8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                  thickness: 2,
                                  indent: width / 3,
                                  endIndent: width / 3),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Choose Coach",
                                  style: TextStyle(
                                      color: Color(0xff303952),
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                ),
                                SizedBox(
                                  width: width * .6,
                                  child: CustomDropDown(
                                    isPanDown: false,
                                    isBackPressedOrTouchedOutSide: true,
                                    // _isBackPressedOrTouchedOutSide,
                                    dropDownBGColor: Colors.white,
                                    dropDownOverlayBGColor: Colors.transparent,
                                    padding: 8,
                                    dropDownIcon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                      size: 24,
                                    ),
                                    elevation: 1,
                                    dropDownBorderRadius: 10,
                                    dropDownTopBorderRadius: 10,
                                    dropDownBottomBorderRadius: 10,
                                    dropDownIconBGColor: Colors.transparent,
                                    dropDownList: const [
                                      'Amr Ali El amery (3 Sessions)',
                                      'Amr Ali El Amery (6 Sessions)',
                                      'Hend Mousa',
                                    ],
                                    selectedItem: 'Coach Name',
                                    numOfListItemToShow: 5,
                                    selectedItemTextStyle:const  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    dropDownListTextStyle:const  TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        backgroundColor: Colors.transparent),
                                    onDropDownItemClick: (selectedItem) {
                                      // _selectedItem = selectedItem;
                                    },
                                    dropStateChanged: (isOpened) {
                                      // _isDropDownOpened = isOpened;
                                      // if (!isOpened) {
                                      // _isBackPressedOrTouchedOutSide = false;
                                      // }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Expanded(
                                child: SizedBox(
                                  height: height * .6,
                                  child: SfCalendar(
                                    view: CalendarView.month,
                                    timeSlotViewSettings:
                                        const TimeSlotViewSettings(
                                      timeIntervalHeight: 30,
                                      timeIntervalWidth: 30,
                                      // dayFormat: '',
                                      timeTextStyle: normalTextStyle_500,
                                      allDayPanelColor: primaryColor,
                                      timeRulerSize: 100,
                                    ),
                                    // allowedViews: _allowedViews,
                                    showDatePickerButton: false,
                                    showCurrentTimeIndicator: false,
                                    allowAppointmentResize: false,
                                    showNavigationArrow: true,
                                    viewHeaderHeight: 100,
                                    todayTextStyle:
                                    const TextStyle(color: whiteColor),
                                    todayHighlightColor: accentColor,
                                    backgroundColor: whiteColor,
                                    allowViewNavigation: false,
                                    headerStyle: const CalendarHeaderStyle(
                                        backgroundColor: whiteColor,
                                        textStyle: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                    headerDateFormat: 'MMMM yyyy',
                                    firstDayOfWeek: 1,
                                    monthViewSettings: const MonthViewSettings(
                                      dayFormat: 'EEE',
                                      agendaItemHeight: 30,
                                      // monthCellStyle: MonthCellStyle(
                                      //     textStyle: TextStyle(
                                      //         fontStyle: FontStyle.normal,
                                      //         fontSize: 15,
                                      //         color: Colors.black),
                                      //     trailingDatesTextStyle: TextStyle(
                                      //         fontStyle: FontStyle.normal,
                                      //         fontSize: 15,
                                      //         color: Colors.black),
                                      //     leadingDatesTextStyle: TextStyle(
                                      //         fontStyle: FontStyle.normal,
                                      //         fontSize: 15,
                                      //         color: Colors.black),
                                      //     backgroundColor: Colors.red,
                                      //     todayBackgroundColor: Colors.blue,
                                      //     leadingDatesBackgroundColor:
                                      //         Colors.grey,
                                      //     trailingDatesBackgroundColor:
                                      //         Colors.grey),
                                    ),
                                    viewHeaderStyle: const ViewHeaderStyle(
                                        dateTextStyle: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        // backgroundColor: primaryColor,
                                        dayTextStyle: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0)),
                                    weekNumberStyle: const WeekNumberStyle(
                                        backgroundColor: accentColor),
                                    appointmentTextStyle:
                                        const TextStyle(color: accentColor),
                                    appointmentTimeTextFormat: 'HH:MM',
                                    showWeekNumber: false,
                                    selectionDecoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 68, 140, 255),
                                          width: 2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4)),
                                      shape: BoxShape.rectangle,
                                    ),
                                    cellBorderColor: Colors.transparent,
                                    viewNavigationMode: ViewNavigationMode.none,
                                    onViewChanged:
                                        (ViewChangedDetails details) {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            backgroundColor: accentColor,
            child:const  Icon(Icons.add)),
      ),
    );
  }

  void _addResourceDetails() {
    _nameCollection = <String>[];
    _nameCollection.add('Mona Mohamed');
    _nameCollection.add('Ahmed Ali');
    _nameCollection.add('Fady');
    _nameCollection.add('Gold GYM');

    // _userImages = <String>[];
    // _userImages.add('assets/images/different_type_cyclists.png');
    // _userImages.add('images/People_Circle8.png');
    // _userImages.add('assets/images/different_type_cyclists.png');
    // _userImages.add('assets/images/different_type_cyclists.png');
    // _userImages.add('assets/images/different_type_cyclists.png');
    // _userImages.add('assets/images/app_logo.png');
    // _userImages.add('assets/images/addidas_fit.png');
    // _userImages.add('assets/images/cs_logo.png');
    // _userImages.add('assets/images/different_type_cyclists.png');
    // _userImages.add('assets/images/cs_logo.png');
    // _userImages.add('assets/images/different_type_cyclists.png');
    // _userImages.add('assets/images/cs_logo.png');
  }

  void _addResources() {
    // Random random = Random();
    for (int i = 0; i < _nameCollection.length; i++) {
      _employeeCollection.add(CalendarResource(
        displayName: _nameCollection[i],
        id: '000' + i.toString(),
        color: accentColor,
      ));
      // image:
      //     i < _userImages.length ? ExactAssetImage(_userImages[i]) : null));
    }
  }

  // void _addSpecialRegions() {
  //   final DateTime date = DateTime.now();
  //   Random random = Random();
  //   for (int i = 0; i < _employeeCollection.length; i++) {
  //     _specialTimeRegions.add(TimeRegion(
  //         startTime: DateTime(date.year, date.month, date.day, 13, 0, 0),
  //         endTime: DateTime(date.year, date.month, date.day, 14, 0, 0),
  //         text: 'Lunch',
  //         resourceIds: <Object>[_employeeCollection[i].id],
  //         recurrenceRule: 'FREQ=DAILY;INTERVAL=1'));
  //
  //     if (i % 2 == 0) {
  //       continue;
  //     }
  //
  //     final DateTime startDate = DateTime(
  //         date.year, date.month, date.day, 17 + random.nextInt(7), 0, 0);
  //
  //     _specialTimeRegions.add(TimeRegion(
  //       startTime: startDate,
  //       endTime: startDate.add(const Duration(hours: 3)),
  //       text: 'Not Available',
  //       enablePointerInteraction: false,
  //       resourceIds: <Object>[_employeeCollection[i].id],
  //     ));
  //   }
  // }

  void _addAppointmentDetails() {
    _subjectCollection = <String>[];
    _subjectCollection.add('Play Cardio');
    _subjectCollection.add('Bi');
    _subjectCollection.add('FITNESS');
    _subjectCollection.add('Session');
    _subjectCollection.add('nutrition');
    _subjectCollection.add('Meeting');
    _subjectCollection.add('nutrition');
    _subjectCollection.add('Play Cardio');
    _subjectCollection.add('nutrition');
    _subjectCollection.add('Finish');
  }

  void _addAppointments() {
    _shiftCollection = <Appointment>[];
    final Random random = Random();
    for (int i = 0; i < _employeeCollection.length; i++) {
      final List<String> _employeeIds = <String>[
        _employeeCollection[i].id.toString()
      ];
      if (i == _employeeCollection.length - 1) {
        int index = random.nextInt(5);
        setState(() {
          // index = index == i ? index + 1 : index;
          _employeeIds.add(_employeeCollection[index].id.toString());
        });
      }

      for (int k = 0; k < 365; k++) {
        if (_employeeIds.length > 1 && k % 2 == 0) {
          continue;
        }
        for (int j = 0; j < 2; j++) {
          final DateTime date = DateTime.now().add(Duration(days: k + j));
          int startHour = 7 + random.nextInt(6);
          startHour =
              startHour >= 13 && startHour <= 14 ? startHour + 1 : startHour;
          final DateTime _shiftStartTime =
              DateTime(date.year, date.month, date.day, startHour, 0, 0);
          _shiftCollection.add(Appointment(
              startTime: _shiftStartTime,
              endTime: _shiftStartTime.add(const Duration(hours: 2)),
              subject: _subjectCollection[random.nextInt(8)],
              color: primaryColor,
              startTimeZone: '',
              endTimeZone: '',
              resourceIds: _employeeIds));
        }
      }
    }
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source, List<CalendarResource> resourceColl) {
    appointments = source;
    resources = resourceColl;
  }
}
