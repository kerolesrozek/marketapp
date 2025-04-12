import 'package:flutter/material.dart';
import '../../../../../core/consts.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key, required this.onChanged,
  });
final ValueChanged<bool> onChanged;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
          value: isCheck,
          onChanged: (onChanged) {
            setState(() {
              isCheck = onChanged!;
              widget.onChanged(onChanged);
            });
          },
          activeColor: kBasicColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
        Expanded(
          child: Text(
            ' من خلال إنشاء حساب ، فإنك توافق على الشروط والأحكام الخاصة بنا',
            style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
