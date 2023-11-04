import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/app_icons.dart';
import '../../common/services/api_service.dart';
import '../widgets/categories/custom_card.dart';
import 'bloc/input_bloc.dart';
import 'repository/input_repository.dart';
import 'widget/input_page_products_screen.dart';

enum Categories {
  food(category: "Food", id: 2),
  office(category: "Office", id: 4),
  electronics(category: "Electronics", id: 3),
  household(category: "Household", id: 1),
  building(category: "Building", id: 5),
  another(category: "Another", id: 6);

  final String category;
  final int id;
  const Categories({
    required this.category,
    required this.id,
  });
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
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
                        create: (context) => InputBloc(
                          InputRepositoryImp(
                            APIService(),
                          ),
                        )..add(
                            InputPageGetProducts(
                              Categories.values[index].id,
                            ),
                          ),
                        child: InputPageProducts(
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
