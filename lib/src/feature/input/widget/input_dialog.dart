import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_builder/page_builder.dart';
import '../bloc/input_bloc.dart';
import '../models/post_input_model.dart';

class InputDialog extends StatefulWidget {
  final String productName;
  final int id;
  const InputDialog({
    required this.productName,
    required this.id,
    super.key,
  });

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  late final TextEditingController countController;
  late final TextEditingController priceController;

  @override
  void initState() {
    countController = TextEditingController();
    priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                widget.productName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      fontFamily: "Inter-Regular",
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              inputFormatter: FilteringTextInputFormatter.allow(
                RegExp(r"[0-9]"),
              ),
              controller: countController,
              text: "Count",
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: priceController,
              text: "Price",
            ),
            // const Spacer(),
            const SizedBox(height: 15),
            CustomButton(
              onCancelled: () => Navigator.pop(context),
              onSubmitted: () {
                PostInputModel inputModel = PostInputModel(
                  product: widget.id,
                  count: int.tryParse(countController.text) ?? 0,
                  price: priceController.text,
                );
                context.read<InputBloc>().add(PostInputEvent(inputModel));
                // Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const  PageBuilder(isSuperUser: false),
                  ),
                );
              },
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}
