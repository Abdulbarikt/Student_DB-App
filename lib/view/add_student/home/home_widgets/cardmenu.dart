import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../controller/addstudent/bloc/home/bloc/home_bloc.dart';
import '../../../../utils/constants/constants.dart';


class CardWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final String path;
  final event;
  final String buttonText;
  const CardWidget({
    super.key,
    required this.homeBloc,
    required this.event,
    required this.path,
    required this.buttonText,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: Constants.cardPadding,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.white,
        onTap: () => homeBloc.add(event),
        child: Column(
          children: [
            SvgPicture.asset(
              path,
              fit: BoxFit.contain,
              height: MediaQuery.sizeOf(context).width / 1.5,
            ),
            Constants.heightSized,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: Constants.cartTextStyle,
                ),
                Constants.widthtSized,
                Constants.cardCircleAvatar
              ],
            ),
            Constants.heightSized
          ],
        ),
      ),
    );
  }
}
