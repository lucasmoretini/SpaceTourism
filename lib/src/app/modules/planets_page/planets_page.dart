import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/components/card_image_component%20copy.dart';
import 'package:space_tourism/src/app/modules/planets_page/planets_controller.dart';
import '../../utils/paddings.dart';

class PlanetsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlanetsPageState();
  }
}

class PlanetsPageState extends State<PlanetsPage> {
  final controller = PlanetsController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget List() {
      return ListView.separated(
        padding: EdgeInsets.only(
          top: AppPaddings.topPadding,
          left: AppPaddings.borderPadding,
          right: AppPaddings.borderPadding,
          bottom: 60,
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 40,
          );
        },
        shrinkWrap: true,
        itemCount: controller.transactionList.length,
        itemBuilder: (context, index) {
          var listItem = controller.transactionList[index];
          return CardImage(
            pathImage: listItem.pathImage!,
            title: listItem.name!,
            description: listItem.description!,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Turismo Espacial'),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Conheça os Planetas mais próximos do Sol",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: List(),
            ),
          ],
        ),
      ),
    );
  }
}
