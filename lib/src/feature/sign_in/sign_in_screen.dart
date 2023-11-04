import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/api_constants.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../../common/services/api_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/page_builder/page_builder.dart';
import '../widgets/switch_section.dart';
import 'bloc/sign_in_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final valueNotifier = ValueNotifier(true);
  late final TextEditingController userController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Write your username";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Write your password";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PageBuilder(
                isSuperUser: state.isSuperUser,
              ),
            ),
          );

          APIService.updateToken();

          debugPrint(tokenRefresh);
        }
        if (state is SignInErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SignInLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppIcons.backgroundImages,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, 1),
                child: Container(
                  height: size.height * 0.659,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(160, 50),
                      topLeft: Radius.elliptical(160, 50),
                    ),
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Align(
                      alignment: const Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        child: Container(
                          height: size.height * 0.593,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey05,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SwitchSection(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 50,
                                isSelected: valueNotifier,
                                firstText: "Sign In",
                                secondText: "Sign Up",
                              ),
                              ValueListenableBuilder(
                                valueListenable: valueNotifier,
                                builder: (context, value, _) {
                                  return value
                                      ? Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                                height: size.height * 0.052),
                                            CustomTextField(
                                              validator: validateUsername,
                                              controller: userController,
                                              text: "Username",
                                              hintText: "diordev",
                                            ),
                                            const SizedBox(height: 30),
                                            CustomTextField(
                                              validator: validatePassword,
                                              controller: passwordController,
                                              text: "Password",
                                              hintText: "password",
                                              helperText: "Forgot password?",
                                            ),
                                            SizedBox(
                                                height: size.height * 0.026),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    context
                                                        .read<SignInBloc>()
                                                        .add(
                                                          SignInUserEvent(
                                                            username:
                                                                userController
                                                                    .text
                                                                    .toString()
                                                                    .trim(),
                                                            password:
                                                                passwordController
                                                                    .text
                                                                    .toString()
                                                                    .trim(),
                                                          ),
                                                        );
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.mainColor,
                                                  shape: const StadiumBorder(),
                                                  fixedSize: Size(
                                                    size.width * 0.944,
                                                    size.height * 0.069,
                                                  ),
                                                ),
                                                child: Text(
                                                  "Sign In",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge!
                                                      .copyWith(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "Inter-Regular",
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const Center(
                                          child: Text("Sign up"),
                                        );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: const Alignment(-0.8, -0.8),
                child: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter-Regular",
                      ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.6, -0.73),
                child: Text(
                  "Please login with your information",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter-Regular",
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
