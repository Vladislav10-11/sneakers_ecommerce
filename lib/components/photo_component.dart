import 'package:e_commerce/constances.dart';
import 'package:flutter/material.dart';

class PhotoComponent extends StatefulWidget {
  final String productPhoto;

  const PhotoComponent({
    super.key,
    required this.productPhoto,
  });

  @override
  State<PhotoComponent> createState() => _PhotoComponentState();
}

class _PhotoComponentState extends State<PhotoComponent> {
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
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: isSelected ? greenColor : Colors.transparent),
          image: DecorationImage(
            image: AssetImage(widget.productPhoto),
          ),
        ),
      ),
    );
  }
}
