import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:string_validator/string_validator.dart';

class VigilanceOptionWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool? observable;

  const VigilanceOptionWidget({
    super.key,
    required this.title,
    required this.controller,
    this.observable = false,
  });

  @override
  State<VigilanceOptionWidget> createState() => _VigilanceOptionWidgetState();
}

class _VigilanceOptionWidgetState extends State<VigilanceOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 32),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _minusOnPressed(),
                  icon: Icon(
                    CupertinoIcons.minus_circle,
                    size: MediaQuery.of(context).size.aspectRatio * 65,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: TextField(
                    controller: widget.controller,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                  width: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () => _plusOnPressed(),
                  icon: Icon(
                    CupertinoIcons.add_circled,
                    size: MediaQuery.of(context).size.aspectRatio * 65,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _plusOnPressed() {
    FocusScope.of(context).unfocus();
    var sum = toInt(widget.controller.text) + 1;
    widget.controller.text = sum.toString();
  }

  _minusOnPressed() {
    FocusScope.of(context).unfocus();
    var sum = toInt(widget.controller.text) - 1;
    print(sum);
    sum <= 0
        ? widget.controller.text = '0'
        : widget.controller.text = sum.toString();
  }
}
