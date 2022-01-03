
import 'package:flutter/material.dart';
import 'dropdown_options.dart';

class DropDown2 extends StatefulWidget {

  final List<dynamic> resultOfDropdown1;
  DropDown2({required this.resultOfDropdown1});

  @override
  _DropDown2State createState() => _DropDown2State();
}

class _DropDown2State extends State<DropDown2> {

  late DropdownOption _selectedOption2;
  late List<DropdownMenuItem<DropdownOption>> _dropdownMenuItems2;

  List<DropdownMenuItem<DropdownOption>> getDropdownOption(List<dynamic> option) {

    List<DropdownOption> myList = [];

    for (var doc in option) {
      myList.add(
        DropdownOption(
          title: doc['name'],
          data: doc['options'],
        ),
      );
    }

    List<DropdownMenuItem<DropdownOption>> items = [];

    for (DropdownOption option in myList){

      items.add(
        DropdownMenuItem(
          value: option,
          child: Text(option.title),
        ),
      );

    }

    return items;

  }

  @override
  Widget build(BuildContext context) {

    _dropdownMenuItems2 = getDropdownOption(widget.resultOfDropdown1);
    _selectedOption2 = _dropdownMenuItems2[0].value!;

    return DropdownButton(
      value: _selectedOption2,
      items: _dropdownMenuItems2,
      onChanged: (value){

        final result = value as DropdownOption;

        setState((){
          _selectedOption2 = result;
        });

        print(_selectedOption2.title);

      },
    );

  }
}
