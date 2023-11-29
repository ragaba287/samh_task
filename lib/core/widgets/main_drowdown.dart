// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDropDown extends StatefulWidget {
  const MainDropDown({
    super.key,
    required this.items,
    this.title = 'Title',
    this.icon = Icons.abc,
    required this.onChange,
  });

  final List<String> items;
  final String title;
  final IconData icon;
  final Function onChange;

  @override
  State<MainDropDown> createState() => _MainDropDownState();
}

class _MainDropDownState extends State<MainDropDown> {
  String selectedVal = '';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title.toUpperCase(),
          style: TextStyle(
            color: Colors.black26,
            fontSize: 12.sp,
          ),
        ),
        DropdownButton(
          elevation: 0,
          isDense: true,
          isExpanded: true,
          underline: Container(height: 2, color: Colors.black26),
          dropdownColor: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          icon: Icon(Icons.arrow_drop_down, color: theme.colorScheme.primary),
          iconSize: 30.w,
          selectedItemBuilder: (BuildContext context) {
            return widget.items.map(
              (String value) {
                return Text(
                  selectedVal.isEmpty ? widget.items.first : selectedVal,
                  style: TextStyle(color: theme.colorScheme.primary),
                );
              },
            ).toList();
          },
          items: widget.items.map(
            (String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (String? v) {
            setState(() {
              selectedVal = v ?? '';
              widget.onChange(v);
            });
          },
          value: selectedVal.isEmpty ? widget.items.first : selectedVal,
        ),
      ],
    );
  }
}
