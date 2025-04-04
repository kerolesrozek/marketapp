import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitesapp/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:fruitesapp/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:fruitesapp/features/home/domain/usecases/get_user_data_usecase.dart';
import 'package:fruitesapp/features/home/presentation/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key});

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserDataCubit>(context)
        .getUserData(uid: FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset(
          'lib/assets/images/profile_image.png',
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        'صباح الخير !..',
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xff949D9E),
        ),
      ),
      subtitle: BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserDataSuccess) {
            return Text(
              state.userEntity.name,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xff0C0D0D),
              ),
            );
          } else if (state is GetUserDataFailure) {
            return Text(state.errorMessage);
          } else {
            return Skeletonizer(
                child: Text(
              'state.userEntity.name',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xff0C0D0D),
              ),
            ));
          }
        },
      ),
      trailing: Container(
          padding: EdgeInsets.all(12),
          decoration:
              ShapeDecoration(shape: OvalBorder(), color: Color(0xffEEF8ED)),
          child: SvgPicture.asset('lib/assets/images/notification.svg')),
    );
  }
}
