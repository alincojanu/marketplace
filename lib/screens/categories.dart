
import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/models/category.dart';
import 'package:marketplace/widgets/labeled_checkbox.dart';

class Categories extends StatelessWidget {
  List<Category> categories = [];

  Categories({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isSelected = false;

    return Accordion(
      headerBackgroundColor: Colors.grey.shade300,
      contentBackgroundColor: Colors.grey.shade300,
      contentBorderColor: Colors.white,
      children: [
        AccordionSection(
            isOpen: true,
            header: const Text(
              'CATEGORIES',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            content: Column(
              children: categories
                  .map((category) => LabeledCheckbox(
                        label: category.name.toUpperCase(),
                        value: _isSelected,
                        onChanged: (bool newValue) {
                          _isSelected = newValue;
                        },
                      ))
                  .toList(),
            )),
      ],
    );
  }
}
