import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/services/api_service.dart';
import '../../balance/balance_screen.dart';
import '../../history/bloc/history_bloc.dart';
import '../../history/history_screen.dart';
import '../../history/repository/history_repository.dart';
import '../../input/input_screen.dart';
import '../../output/output_screen.dart';
import 'custom_bottom_app_bar.dart';

class PageBuilder extends StatefulWidget {
  final bool isSuperUser;
  const PageBuilder({
    required this.isSuperUser,
    super.key,
  });

  @override
  State<PageBuilder> createState() => _MainPagesState();
}

class _MainPagesState extends State<PageBuilder> {
  late final PageController controller;

  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPageChanged(int value) {
    controller.animateToPage(
      value,
      duration: const Duration(microseconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomSuperUserBottom(
        isSupersUser: widget.isSuperUser,
        onPressed: onPageChanged,
      ),
      body: PageView(
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const InputScreen(),
          const OutputScreen(),
          const Balance(),
          BlocProvider(
            create: (context) => HistoryBloc(
              HistoryRepositoryImp(
                APIService(),
              ),
            )..add(
                const GetInputsAndOutputsForHistory(),
              ),
            child: BlocProvider(
              create: (context) => HistoryBloc(
                HistoryRepositoryImp(
                  APIService(),
                ),
              )..add(
                  const GetInputsAndOutputsForHistory(),
                ),
              child: const HistoryScreen(),
            ),
          ),
        ],
      ),
    );
  }
}

class NotUserPageBuilder extends StatefulWidget {
  const NotUserPageBuilder({super.key});

  @override
  State<NotUserPageBuilder> createState() => _NotUserPageBuilderState();
}

class _NotUserPageBuilderState extends State<NotUserPageBuilder> {
  late final PageController controller;

  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPageChanged(int value) {
    controller.animateToPage(
      value,
      duration: const Duration(microseconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomNotSuperUserBottom(
        onPressed: onPageChanged,
      ),
      body: PageView(
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const OutputScreen(),
          BlocProvider(
            create: (context) => HistoryBloc(
              HistoryRepositoryImp(
                APIService(),
              ),
            )..add(
                const GetInputsAndOutputsForHistory(),
              ),
            child: BlocProvider(
              create: (context) => HistoryBloc(
                HistoryRepositoryImp(
                  APIService(),
                ),
              )..add(
                  const GetInputsAndOutputsForHistory(),
                ),
              child: const HistoryScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
