import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapkart_app/ui/widgets/gaps.dart';

class MyBottomAppBarItem {
  MyBottomAppBarItem({this.iconData, this.text});

  IconData iconData;
  String text;
}

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 56.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color: Colors.grey,
    this.selectedColor: Colors.deepPurple,
    this.notchedShape,
    this.onTabSelected,
  });

  final List<MyBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => MyBottomAppBarState();
}

class MyBottomAppBarState extends State<MyBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTabItem({
    MyBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Gaps.vGap4,
                Text(
                  item.text,
                  style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          items[0],
          items[1],
          Gaps.hGap24,
          items[2],
          items[3]
        ],
      ),
    );
  }
}
