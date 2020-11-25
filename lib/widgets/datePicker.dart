import 'dart:ui';

import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onChanged;

  const DatePicker({Key key, this.onChanged}) : super(key: key);
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime pickedDate;
  Color color;
  @override
  void initState() {
    color = Colors.grey;
    super.initState();
    pickedDate = DateTime.now();
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
                '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}',
                style: TextStyle(color: this.color),
              ),
            ),
            Container(
              child: Icon(
                Icons.calendar_today,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }

  _pickTime() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 20),
      initialDate: pickedDate,
    );
    if (date != null)
      setState(() {
        pickedDate = date;
        widget.onChanged(pickedDate);
        color = Colors.black;
      });
  }
}
