import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace/models/category.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _Categories createState() => _Categories();
}

class _Categories extends State<Categories> {
  Category mainCategory = Category(id: 0, name: 'CATEGORIES');
  var categories = List<Category>.empty(growable: true);

  final String url =
      'https://marketplace-be-epm-marketplace.apps.cluster6.eu.aws.cloudapp.epam.com/';
  var client = http.Client();

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    try {
      http.Response response =
      await client.get(Uri.parse('$url/api/categories'));
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        categories.addAll(
            parsed.map<Category>((json) => Category.fromJson(json)).toList());
      }
    } catch (e) {
      categories.add(mainCategory);
      print(e);
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = mainCategory.name;
    bool _isSelected = false;

    return DropdownButton<String>(
      autofocus: true,
      underline: Text(mainCategory.name),
      icon: const Icon(Icons.keyboard_arrow_up_sharp),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: categories.map((Category category) {
        return DropdownMenuItem<String>(
          value: category.name,
          child: LabeledCheckbox(
            label: category.name,
            padding: const EdgeInsets.all(10),
            value: _isSelected,
            onChanged: (bool newValue) {
              print('dropdown $newValue');
              setState(() {
                _isSelected = newValue;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
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
                  MaterialStateColor.resolveWith((states) => Colors.lightBlueAccent),
              onChanged: (bool? newValue) {
                // print(newValue);
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
