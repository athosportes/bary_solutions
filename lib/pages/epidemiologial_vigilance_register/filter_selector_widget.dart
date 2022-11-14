import 'package:flutter/material.dart';

class FilterSelectorWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  final void Function() onTap;

  const FilterSelectorWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.45,
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD0D0D0), width: 0.7),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Row(
                  children: [
                    Icon(
                      icon,
                      size: MediaQuery.of(context).size.aspectRatio * 50,
                    ),
                  ],
                ),
              ),
              Positioned(
                  child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
