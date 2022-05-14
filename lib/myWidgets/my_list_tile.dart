import 'package:flutter/material.dart';
import 'package:groceries_n_you/customIcons/custom_icons_icons.dart';

class MyListTileMain extends StatelessWidget {
  String image;
  String text;
  void Function() onTap;

  MyListTileMain(this.image, this.text, this.onTap, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff8EB4FF),
          ),
        ),
        color: Color(0xff699BFF),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(image),
        minLeadingWidth: 1,
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xffFFAE2D),
          ),
        ),
        trailing: const Icon(
          Icons.add,
          color: Color(0xffFFAE2D),
        ),
      ),
    );
  }
}

class MyListTileSub extends StatelessWidget {
  String text;
  void Function() onTap;
  Widget icon;

  MyListTileSub(this.text, this.onTap, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffB4CDFF),
          ),
        ),
        color: Color(0xff8EB4FF),
      ),
      child: ListTile(
        onTap: onTap,
        minLeadingWidth: 1,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
        ),
        trailing: icon,
      ),
    );
  }
}

class MyListTileSubSub extends StatelessWidget {
  String text;
  void Function() onTap;
  Widget icon;

  MyListTileSubSub({
    required this.text,
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffD9E6FF),
          ),
        ),
        color: Color(0xffB4CDFF),
      ),
      child: ListTile(
        onTap: onTap,
        minLeadingWidth: 1,
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
        trailing: icon,
      ),
    );
  }
}

class MyListTileExpand extends StatefulWidget {
  final Color bgColor;
  final Color borderColor;
  Widget imageAsset;
  final String text;
  List<Widget> children;

  MyListTileExpand({
    required this.children,
    required this.imageAsset,
    required this.bgColor,
    required this.borderColor,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<MyListTileExpand> createState() => _MyListTileExpandState();
}

class _MyListTileExpandState extends State<MyListTileExpand> {
  late final Color _background;
  late final Color _border;
  late Widget _image;
  late String _text;
  List<Widget> _childs = [];
  bool _isExpanded = false;

  @override
  void initState() {
    _background = widget.bgColor;
    _border = widget.borderColor;
    _image = widget.imageAsset;
    _text = widget.text;
    _childs = widget.children;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _border,
          ),
        ),
        color: _background,
      ),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        leading: _image,
        title: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(right: 60),
          child: Text(
            _text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFAE2D),
            ),
          ),
        ),
        trailing: Icon(
          !_isExpanded ? Icons.add : CustomIcons.minus,
          color: const Color(0xffFFAE2D),
        ),
        children: _childs,
      ),
    );
  }
}
