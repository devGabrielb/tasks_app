import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay> onChanged;

  const TimePicker({Key key, this.onChanged}) : super(key: key);
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay time;
  Color color;
  @override
  void initState() {
    color = Colors.grey;
    super.initState();
    time = TimeOfDay(hour: 0, minute: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickTime,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                '${time.hour} : ${time.minute} ${_period(time.period)}',
                style: TextStyle(color: this.color),
              ),
            ),
            Container(
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
        widget.onChanged(time);
        color = Colors.black;
      });
  }

  String _period(DayPeriod day) {
    if (day.index == 0) {
      return "AM";
    } else {
      return "PM";
    }
  }
}
