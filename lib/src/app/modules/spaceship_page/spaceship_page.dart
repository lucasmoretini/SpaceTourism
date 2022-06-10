import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/components/floating_action_button.dart';
import 'package:space_tourism/src/app/modules/intro_page/intro_page.dart';
import 'package:space_tourism/src/app/modules/spaceship_page/spaceship_controller.dart';

import '../../components/button_component.dart';
import '../../components/card_component.dart';
import '../../components/form_filled_component.dart';
import '../../utils/paddings.dart';

class SpaceshipPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SpaceshipPageState();
  }
}

class _SpaceshipPageState extends State<SpaceshipPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode spaceshipNameFocus = FocusNode();
  FocusNode spaceshipDescriptionFocus = FocusNode();

  final controller = SpaceshipController();

  showSnackBar() {
    final snackBar = SnackBar(
      content: const Text('Os campos precisam ser preenchidos!'),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: Colors.red,
      margin: EdgeInsets.only(
        bottom: 24,
        left: AppPaddings.borderPadding,
        right: AppPaddings.borderPadding,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  submitForm() {
    String title = nameController.text;
    String description = descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      showSnackBar();
      return;
    }

    controller.addNewSpaceship(
      spaceshipName: title,
      spaceshipDescription: description,
    );

    FocusManager.instance.primaryFocus?.unfocus();
  }

  resetStack() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => IntroPage(),
      ),
      (route) => false,
    );
  }

  navigatePageCreators() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IntroPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget Form() {
      return Container(
        padding: EdgeInsets.only(
          left: AppPaddings.borderPadding,
          right: AppPaddings.borderPadding,
        ),
        color: const Color.fromARGB(255, 101, 2, 194),
        child: Column(children: [
          const SizedBox(height: 24),
          const Text(
            "Adicione a sua nave espacial",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 248, 244, 244)),
          ),
          const SizedBox(height: 30),
          FormFilledPattern(
            label: 'Nome da nave',
            userInputController: nameController,
            focusNode: spaceshipNameFocus,
            onEditingComplete: () {
              spaceshipDescriptionFocus.nextFocus();
            },
          ),
          const SizedBox(height: 16),
          FormFilledPattern(
            label: 'Descrição da nave',
            userInputController: descriptionController,
            focusNode: spaceshipDescriptionFocus,
            onEditingComplete: submitForm,
          ),
          const SizedBox(height: 42),
          ButtonPattern(
            buttonText: 'Adicionar Nave',
            onPressed: submitForm,
            primaryColor: Colors.white,
            secondColor: const Color.fromARGB(255, 101, 2, 194),
          ),
          const SizedBox(height: 36),
        ]),
      );
    }

    Widget ExitApp() {
      return IconButton(
        icon: const Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
        onPressed: resetStack,
      );
    }

    Widget List() {
      return ListView.separated(
        padding: EdgeInsets.only(
          top: AppPaddings.topPadding,
          left: AppPaddings.borderPadding,
          right: AppPaddings.borderPadding,
          bottom: 60,
        ),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.grey.shade700,
          );
        },
        shrinkWrap: true,
        itemCount: controller.transactionList.length,
        itemBuilder: (context, index) {
          var listItem = controller.transactionList[index];
          return CardPattern(
            title: listItem.spaceshipName!,
            description: listItem.spaceshipDescription!,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Turismo Espacial'),
        actions: <Widget>[ExitApp()],
      ),
      floatingActionButton: FloatingActionButtonComponent(
        onPressed: navigatePageCreators,
      ),
      body: Column(
        children: [
          Form(),
          Expanded(
            child: List(),
          ),
        ],
      ),
    );
  }
}
