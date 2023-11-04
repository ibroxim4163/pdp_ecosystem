import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdp_ecosystem/src/common/services/api_service.dart';
import 'package:pdp_ecosystem/src/feature/sign_in/repository/sign_in_repository.dart';
import 'package:pdp_ecosystem/src/feature/sign_in/sign_in_screen.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../sign_in/bloc/sign_in_bloc.dart';
import '../bloc/output_bloc.dart';

class OutputSearch extends StatefulWidget {
  final int id;

  const OutputSearch({
    required this.id,
    super.key,
  });

  @override
  State<OutputSearch> createState() => _OutputSearchState();
}

class _OutputSearchState extends State<OutputSearch> {
  bool showIcon = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackButton(color: AppColors.blackColor),
            SizedBox(
              height: 45,
              width: width * .7,
              child: TextField(
                onChanged: (value) {
                  context.read<OutputBloc>().add(
                        OutputPageSearch(
                          id: widget.id,
                          text: value,
                        ),
                      );
                },
                onSubmitted: (value) {
                  if (value.isEmpty) {
                    showIcon = true;
                  } else {
                    showIcon = true;
                  }
                  setState(() {});
                },
                cursorHeight: 25,
                cursorColor: AppColors.mainColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .01,
                      horizontal: MediaQuery.of(context).size.width * .04),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(26),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xFF05B06E),
                      width: 1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(26),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.mainColor,
                      width: .3,
                    ),
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(13),
                    child: Image(
                      image: AssetImage(AppIcons.loop),
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SignInBloc(
                        SignInRepositoryImp(
                          APIService(),
                        ),
                      ),
                      child: const SignIn(),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.redColor,
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
