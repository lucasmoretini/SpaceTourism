import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/components/button_component.dart';
import 'package:space_tourism/src/app/components/custom_modal_component.dart';
import 'package:space_tourism/src/app/components/custom_scrollview_component.dart';
import 'package:space_tourism/src/app/model/creator_model.dart';
import 'package:space_tourism/src/app/modules/creators_page/creators_controller.dart';
import 'package:space_tourism/src/app/utils/paddings.dart';

class CreatorsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatorsPageState();
  }
}

class _CreatorsPageState extends State<CreatorsPage> {
  final controller = CreatorsController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      "assets/images/astronauts.jpeg",
      width: double.infinity,
      alignment: Alignment.topCenter,
    );

    var textIntro = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(height: 16),
        Text(
          "Criadores do Projeto",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Clique sobre os foguetes para conhecer os criadores do projeto.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(height: 8),
      ],
    );

    var rockets = AnimatedContainer(
      duration: const Duration(seconds: 1),
      padding: const EdgeInsets.only(bottom: 0, top: 0),
      alignment:
          controller.status ? Alignment.bottomCenter : Alignment.topCenter,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: controller.status ? 1 : 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              alignment: Alignment.center,
              iconSize: 64,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    CreatorModel creator = controller.creators[0];
                    return CustomModal(
                      img: creator.pathImage!,
                      title: creator.name!,
                      descriptions: creator.rm!,
                      text: "fechar",
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.rocket,
                color: Colors.blue,
                size: 64,
              ),
            ),
            IconButton(
              iconSize: 64,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    CreatorModel creator = controller.creators[1];
                    return CustomModal(
                      img: creator.pathImage!,
                      title: creator.name!,
                      descriptions: creator.rm!,
                      text: "fechar",
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.rocket,
                color: Colors.red,
                size: 64,
              ),
            ),
          ],
        ),
      ),
    );

    var buttonToggleRockets = Padding(
      padding: EdgeInsets.only(
        top: AppPaddings.topPadding,
        left: AppPaddings.borderPadding,
        right: AppPaddings.borderPadding,
        bottom: 60,
      ),
      child: ButtonPattern(
        onPressed: controller.toggleRockets,
        buttonText: controller.status ? "Lançar foguetes" : "Recolher foguetes",
        primaryColor: const Color.fromARGB(255, 101, 2, 194),
        secondColor: Colors.white,
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollViewComponent(
        child: Column(
          children: [
            image,
            textIntro,
            Expanded(
              flex: 2,
              child: rockets,
            ),
            buttonToggleRockets,
          ],
        ),
      ),
    );
  }
}
