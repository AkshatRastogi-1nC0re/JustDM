import 'package:flutter/material.dart';

class SelectStoreCard extends StatefulWidget {
  final double cardwidth;
  final double cardheight;
  const SelectStoreCard({
    this.cardwidth = 180,
    this.cardheight = 50,
  });

  @override
  _SelectStoreCardState createState() => _SelectStoreCardState();
}

class _SelectStoreCardState extends State<SelectStoreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.cardwidth,
    );
  }
}
