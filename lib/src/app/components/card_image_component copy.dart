import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String pathImage;
  final String title;
  final String description;

  CardImage({
    required this.pathImage,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Widget Picture(String pathImage) {
      return Image.asset(
        pathImage,
        width: double.infinity,
        height: 200.00,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.rocket),
            title: Text(
              title,
            ),
            subtitle: Text(
              description,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          const SizedBox(height: 8),
          Picture(
            pathImage,
          ),
        ],
      ),
    );
  }
}
