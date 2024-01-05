import 'package:flutter/material.dart';

class TextColumn extends StatelessWidget {
  const TextColumn(
      {super.key,
      required this.onLinkHovered,
      required this.textColor,
      required this.backgroundColor});

  final Function(bool) onLinkHovered;
  final Color textColor;
  final Color backgroundColor;

  TextStyle get _defaultTextStyle => TextStyle(color: textColor);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      color: backgroundColor,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Hello", style: _defaultTextStyle.copyWith(
            fontSize: 30
          ),),
          const SizedBox(
            height: 20,
          ),
          Text("Check out this link:", style: _defaultTextStyle),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onHover: onLinkHovered,
            mouseCursor: SystemMouseCursors.none,
            onTap: () {},
            child: Ink(
              child: Column(
                children: [
                  Text("See What happens", style: _defaultTextStyle,),
                  const SizedBox(height: 7,),
                  Container(
                    color: textColor,
                    width: 50,
                    height: 2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
