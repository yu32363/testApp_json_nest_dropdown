import 'package:flutter/material.dart';
import 'dropdown_options.dart';
import './dropdown_2.dart';

class DropDown1 extends StatefulWidget {
  final DropdownOption selectedOption;
  final List<DropdownMenuItem<DropdownOption>> menuItem;

  const DropDown1({
    Key? key,
    required this.selectedOption,
    required this.menuItem,
  }) : super(key: key);

  @override
  _DropDown1State createState() => _DropDown1State();
}

class _DropDown1State extends State<DropDown1> {
  late DropdownOption option1;

  @override
  void initState() {
    super.initState();
    option1 = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButton(
            value: option1,
            items: widget.menuItem,
            onChanged: (value) {
              final result = value as DropdownOption;
              setState(() {
                option1 = result;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          option1.data.isEmpty
              ? const Text(
                  "DEFAULT_2",
                  style: TextStyle(fontSize: 16),
                )
              : DropDown2(
                  resultOfDropdown1: option1.data,
                ),
        ],
      ),
    );
  }
}
