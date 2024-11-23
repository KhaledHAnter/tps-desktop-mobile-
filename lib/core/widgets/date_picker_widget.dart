import 'package:flutter/material.dart';
import 'package:tps/core/theming/colors.dart';

class DatePickerWidget extends StatefulWidget {
  final String label;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime?) onDateSelected;

  const DatePickerWidget({
    super.key,
    required this.label,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
  });

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate; // Initialize with the initial date
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? widget.initialDate,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
        );

        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });
          widget
              .onDateSelected(pickedDate); // Callback to pass the selected date
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: ColorsManager.containergray,
          border: Border.all(color: Colors.black, width: 1.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? '${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}'
                  : widget.label,
              style: TextStyle(
                fontSize: 16,
                color: selectedDate != null ? Colors.black : Colors.grey,
              ),
            ),
            const Icon(Icons.calendar_today, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
