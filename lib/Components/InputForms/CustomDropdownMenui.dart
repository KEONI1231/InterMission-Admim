import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> itemList;
  final ValueChanged<String> onChanged;
  const CustomDropdownMenu({
    required this.itemList,
    required this.onChanged,
    Key? key}) : super(key: key);

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.itemList[0];
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width / 2.53,
      padding: EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border:
        Border.all(color: Colors.grey, width: 1.0),
      ),
      child: DropdownButtonHideUnderline(
        // Underline을 숨깁니다.
        child: DropdownButton<String>(
          value: selectedItem,
          isExpanded: false,
          // DropdownButton이 Container의 전체 너비를 사용하도록 설정합니다.
          items: widget.itemList.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value.toString();

            });
            widget.onChanged(value.toString());
          },
          icon: Icon(Icons.arrow_drop_down,
              color: Colors.grey),
          // 드롭다운 아이콘의 색상 변경
          style: TextStyle(
              color: Colors.black, fontSize: 16.0),
          dropdownColor: Colors.white, // 드롭다운 항목의 배경색 변경
        ),
      ),
    );
  }
}
