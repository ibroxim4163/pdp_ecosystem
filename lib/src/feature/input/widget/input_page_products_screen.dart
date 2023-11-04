import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/services/api_service.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/products_shimmer.dart';
import '../bloc/input_bloc.dart';
import '../repository/input_repository.dart';
import 'input_dialog.dart';
import 'input_search.dart';

class InputPageProducts extends StatefulWidget {
  final int id;
  const InputPageProducts({
    required this.id,
    super.key,
  });

  @override
  State<InputPageProducts> createState() => _InputPageProductsState();
}

class _InputPageProductsState extends State<InputPageProducts> {
  void openDialog({
    required BuildContext context,
    required String productName,
    required int id,
  }) {
    final size = MediaQuery.of(context).size;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: SizedBox(
            height: size.height * 0.6,
            child: BlocProvider(
              create: (context) => InputBloc(
                InputRepositoryImp(
                  APIService(),
                ),
              ),
              child: SingleChildScrollView(
                child: InputDialog(
                  productName: productName,
                  id: id,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InputBloc, InputState>(
      listener: (context, state) {
        if (state is InputErrorState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: SafeArea(
            child: InputSearch(id: widget.id),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: BlocBuilder<InputBloc, InputState>(
            bloc: context.read<InputBloc>(),
            builder: (context, state) {
              if (state is InputLoadingState) {
                return const ProductsShimmer();
              }

              return ListView.separated(
                itemBuilder: (context, index) => SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      title: Text(
                        state.products[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackColor,
                                  fontFamily: "Inter-Regular",
                                ),
                      ),
                      onTap: () => openDialog(
                        context: context,
                        productName: state.products[index].name,
                        id: state.products[index].id,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: state.products.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
