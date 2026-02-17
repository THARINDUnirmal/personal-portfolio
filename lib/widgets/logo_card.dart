import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class LogoCard extends StatelessWidget {
  final String imageUrl;
  const LogoCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Center(child: SvgPicture.asset(imageUrl, fit: BoxFit.cover)),
    );
  }
}
