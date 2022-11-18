import 'package:flutter/material.dart';

class MenuOptionWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onTap;

  const MenuOptionWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Stack(
          children: [
            Positioned(
              left: 32,
              top: 9,
              child: Icon(icon, color: Theme.of(context).primaryColor),
            ),
            Positioned(
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
