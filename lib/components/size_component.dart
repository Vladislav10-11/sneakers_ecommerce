import 'package:e_commerce/constances.dart';
import 'package:flutter/material.dart';

class SizeComponent extends StatefulWidget {
  final String size;
  const SizeComponent({super.key, required this.size});

  @override
  State<SizeComponent> createState() => _SizeComponentState();
}

class _SizeComponentState extends State<SizeComponent> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 30,
        width: 55,
        decoration: BoxDecoration(
            color: isSelected ? greenColor : whiteColor,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            border: Border.all(color: Colors.grey)),
        child: Center(child: Text('US ${widget.size}')),
      ),
    );
  }
}
