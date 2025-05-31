
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildRatinBar extends StatelessWidget {
  const BuildRatinBar({super.key, required this.label, required this.value});
  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: GoogleFonts.cairo(fontWeight: FontWeight.w600)),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            minHeight: 8,
            value: value,
            backgroundColor: Colors.grey[300],
            color: Color(0xffFFB400),
          ),
        ),
      ],
    );
  }
}
