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
                  onPressed: () {},
                  // onPressed: () => _minusOnPressed(),
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
    var newValue = widget.controller.text = sum.toString();
    print(newValue);
  }

  // _minusOnPressed() {
  //   FocusScope.of(context).unfocus();
  //   var newValue = toString(toInt(widget.listenable.value) - 1);
  //   if (toInt(newValue) < 0) {
  //     return;
  //   }
  //   widget.listenable.value = newValue;
  //   widget.controller.text = newValue;
  // }
}
