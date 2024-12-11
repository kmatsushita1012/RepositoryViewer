import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final String value;

  const DetailTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.value});

  @override
  Widget build(BuildContext context) {
    // Provider.of<T>(context) で親Widgetからデータを受け取る
    // ※ 受け取るデータの クラス と <T> は揃えましょう

    return Container(
      height: 40,
      child: Row(
        children: [Text(title), icon, Text(value)],
      ),
    );
  }
}
