import 'package:flutter/material.dart';

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

  MyListTileSub(this.text, this.onTap, {Key? key}) : super(key: key);

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
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
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

class MyListTileSubSub extends StatelessWidget {
  String text;
  void Function() onTap;

  MyListTileSubSub(this.text, this.onTap, {Key? key}) : super(key: key);

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
        trailing: const Icon(
          Icons.add,
          color: Color(0xffFFAE2D),
        ),
      ),
    );
  }
}
