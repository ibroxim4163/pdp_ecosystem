import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/app_icons.dart';
import '../../common/services/api_service.dart';
import '../input/input_screen.dart';
import '../widgets/categories/custom_card.dart';
import 'bloc/output_bloc.dart';
import 'repository/output_repository.dart';
import 'widgets/output_products.dart';

class OutputScreen extends StatelessWidget {
  const OutputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 45,
          ),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: Categories.values.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return CustomCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => OutputBloc(
                          OutputRepositoryImp(
                            APIService(),
                          ),
                        )..add(
                            OutputPageGetProducts(
                              Categories.values[index].id,
                            ),
                          ),
                        child: OutputPageProducts(
                          id: Categories.values[index].id,
                        ),
                      ),
                    ),
                  );
                },
                imageUrl: AppIcons.categories[index],
                text: Categories.values[index].category,
              );
            },
          ),
        ),
      ),
    );
  }
}
