import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'drawer/drawer_final.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateRangePickerController _controller = DateRangePickerController();
  late DateTime _startDate;
  late DateTime _endDate;
  late DateTime _initialSelectedDate; // Add this variable

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now();
    _initialSelectedDate = DateTime(2023, 10, 11); // Set your initial selected date here
    _controller.selectedRanges = [PickerDateRange(_startDate, _endDate)];
  }

  void _updateDateRange(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final range = args.value as PickerDateRange;
      setState(() {
        if(range.startDate != null){
          _startDate = range.startDate!;
        }else{
          print("start null");
        }
        if(range.endDate != null){
          _endDate = range.endDate!;
        }else{
          print("end null");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
           height: 160,
            child: Image(
              fit: BoxFit.cover,
                image: AssetImage('asset/image/calender_back.jpeg')),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0, 10, 0),
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon:
                        Icon(Icons.menu, color: Colors.black, size: 35),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
            child: Container(
              height: 330,
              child: SfDateRangePicker(
                headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center,
                  textStyle: GoogleFonts.montserrat(color: Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                controller: _controller,
                selectionShape: DateRangePickerSelectionShape.circle,
                extendableRangeSelectionDirection: ExtendableRangeSelectionDirection.both,
                todayHighlightColor: Colors.red,
                rangeSelectionColor: Color.fromARGB(225, 229, 224, 223),
                selectionMode: DateRangePickerSelectionMode.range,
                startRangeSelectionColor: Colors.red,
                endRangeSelectionColor: Colors.green,
                selectionColor: Colors.red,
                onSelectionChanged: _updateDateRange,

              ),
            ),
          ),
//         CalendarDatePicker2WithActionButtons(
//           config: CalendarDatePicker2WithActionButtonsConfig(
//             firstDayOfWeek: 1,
//             calendarType: CalendarDatePicker2Type.range,
//             selectedDayTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
//             selectedDayHighlightColor: Colors.purple[800],
//             centerAlignModePicker: true,
//             customModePickerIcon: SizedBox(),
//             dayBuilder: _yourDayBuilder,
//             yearBuilder: _yourYearBuilder,
//           ),
//           value: _dates,
//           onValueChanged: (dates) => _dates = dates,
//         );
//             Text('Start Date: $_startDate'),
//             Text('End Date: $_endDate'),
        ],
      ),
    );
  }
}