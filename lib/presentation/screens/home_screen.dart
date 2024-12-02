import 'package:d4m_new/presentation/widgets/card_car_widget.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.listCard});

  final List<Map<String, String>> listCard;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 40, // Altezza della barra
              color:
                  Theme.of(context).colorScheme.onSurface, // Colore della barra
            ),
            Positioned(
                child: CardCarWidget(
              page: 'home',
              listCard: listCard,
            ))
          ],
        ),
      ],
    );
  }
}
