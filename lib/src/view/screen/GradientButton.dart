import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class GradientButton extends StatefulWidget {
  final double buttonwidth;
  final double buttonheight;
  final String title;
  final Function onPressed;
  const GradientButton({
    this.buttonwidth = 180,
    this.buttonheight = 50,
    this.title = "Explore More",
    required this.onPressed,
  });

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

Color col1 = Color(0xffcb7c0c);
Color col2 = Color(0xfff2d259);
List<Color> colors = [
  col1,
  col2,
];

class _GradientButtonState extends State<GradientButton>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width>580?TextButton(
      onHover: (x) {
        if (x) {
          setState(() {
            colors = [
              col2,
              col1,
            ];
          });
        } else {
          setState(() {
            colors = [
              col1,
              col2,
            ];
          });
        }
      },
      onPressed: () {
        widget.onPressed();
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: Colors.white,
        primary: Colors.black87,
        padding: EdgeInsets.all(0.0),
      ),
      child: AnimatedContainer(
        height: widget.buttonheight,
        width: widget.buttonwidth,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: LinearGradient(
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              colors: colors),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.title,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white,
                  height: 1.3,
                  fontFamily: "Metrisch-Bold",
                  fontSize: 16),
            ),
          ),
        ),
      ),
    ):TextButton(
      onPressed: () {
        widget.onPressed();
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: Colors.white,
        primary: Colors.black87,
        padding: EdgeInsets.all(0.0),
      ),
      child: Container(
        height: widget.buttonheight,
        width: widget.buttonwidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: LinearGradient(
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              colors: colors),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white,
                height: 1.3,
                fontFamily: "Metrisch-Bold",
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
