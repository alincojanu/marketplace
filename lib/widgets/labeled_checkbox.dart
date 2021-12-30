import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding = const EdgeInsets.all(10);
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Text(label),
            ),
            Checkbox(
              value: value,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.grey),
              onChanged: (bool? newValue) {
                print(newValue);
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
