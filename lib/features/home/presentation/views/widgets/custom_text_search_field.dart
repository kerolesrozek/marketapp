import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextSearchField extends StatelessWidget {
  const CustomTextSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      elevation: 0.1,
      shadowColor: Colors.grey.shade100,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'ابحث عن.......',
          hintStyle: GoogleFonts.cairo(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xff949D9E),
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset('lib/assets/images/search-normal.svg'),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          suffixIcon: Image.asset(
            'lib/assets/images/search_setting-4.png',
            color: Color(0xff949D9E),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
