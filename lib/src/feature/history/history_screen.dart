import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../common/constants/app_colors.dart';
import '../widgets/custom_divider.dart';
import '../widgets/products_shimmer.dart';
import '../widgets/switch_section.dart';
import 'bloc/history_bloc.dart';
import 'widgets/custom_history_products.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DateTime date = DateTime.now();
  ValueNotifier<bool> isSelected = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HistoryBloc, HistoryState>(
      listener: (context, state) {
        if (state.status == HistoryStatus.error) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: Text(state.message!),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 70),
          child: SafeArea(
            child: SwitchSection(
              width: MediaQuery.of(context).size.width * 0.5 - 20,
              isSelected: isSelected,
              firstText: "Input",
              secondText: "Output",
            ),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: isSelected,
          builder: (context, value, child) {
            if (value) {
              return BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  if (state.status == HistoryStatus.loading) {
                    return const ProductsShimmer();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const CustomDivider();
                        },
                        itemCount: state.inputs.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            endActionPane: ActionPane(
                              extentRatio: 1 / 4,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  flex: 1,
                                  onPressed: (context) {
                                    context.read<HistoryBloc>().add(
                                          DeleteInputEvent(
                                            state.inputs[index].id,
                                          ),
                                        );
                                  },
                                  backgroundColor: AppColors.redColor,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: CustomHistoryProducts(
                                productName: state.inputs[index].product,
                                date: state.inputs[index].date,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              );
            }
            return BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, state) {
                if (state.status == HistoryStatus.loading) {
                  return const ProductsShimmer();
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const CustomDivider();
                      },
                      itemCount: state.outputs.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 1 / 4,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: (context) {
                                  context.read<HistoryBloc>().add(
                                        DeleteOutputEvent(
                                          state.outputs[index].id,
                                        ),
                                      );
                                },
                                backgroundColor: AppColors.redColor,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: CustomHistoryProducts(
                              productName: state.outputs[index].product,
                              date: state.outputs[index].date,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
