import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/services/api_service.dart';
import '../bloc/input_bloc.dart';
import '../repository/input_repository.dart';
import 'add_product_dialog.dart';

class InputSearch extends StatefulWidget {
  final int id;

  const InputSearch({
    required this.id,
    super.key,
  });

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  bool showIcon = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackButton(color: AppColors.blackColor),
          SizedBox(
            height: 45,
            width: showIcon ? width * .7 : width * .8,
            child: TextField(
              onTap: () {
                setState(() {
                  showIcon = false;
                });
              },
              onChanged: (value) {
                context.read<InputBloc>().add(
                      InputPageSearchEvent(value, widget.id),
                    );
                if (value.isNotEmpty) {
                  setState(() {
                    showIcon = false;
                  });
                } else {
                  setState(() {
                    showIcon = true;
                  });
                }
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
                alignLabelWithHint: true,
                hintText: "Search",
                hintStyle: const TextStyle(
                    color: AppColors.mainColor, fontWeight: FontWeight.w500),
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
          showIcon
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => BlocProvider(
                          create: (context) => InputBloc(
                            InputRepositoryImp(APIService()),
                          ),
                          child: AddProductDialog(
                            categoryId: widget.id,
                          ),
                        ),
                      );

                      await Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          context
                              .read<InputBloc>()
                              .add(RefreshInput(widget.id));
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_sharp,
                      color: AppColors.mainColor,
                      size: 30,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
