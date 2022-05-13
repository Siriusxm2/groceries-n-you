import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyExpansionTile extends StatefulWidget {
  String parentText;
  String childText;
  MyExpansionTile(this.parentText, this.childText, {Key? key})
      : super(key: key);

  @override
  State<MyExpansionTile> createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  bool _isExpanded = false;
  String _pText = '';
  String _cText = '';

  @override
  void initState() {
    _pText = widget.parentText;
    _cText = widget.childText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
      expandedAlignment: Alignment.centerLeft,
      trailing: const SizedBox(),
      leading: AnimatedRotation(
        turns: _isExpanded ? 0.25 : 0,
        duration: const Duration(milliseconds: 300),
        child: Transform.rotate(
          angle: 90 * math.pi / 180,
          child: const Icon(
            Icons.expand_less,
            color: Color(0xff666666),
            size: 30,
          ),
        ),
      ),
      title: SizedBox(
        width: 20,
        child: Text(
          _pText,
          style: const TextStyle(
            color: Color(0xff333333),
          ),
        ),
      ),
      children: [
        Container(
          margin: const EdgeInsets.only(left: 40),
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width - 80,
          child: Text(_cText),
        ),
      ],
    );
  }
}
