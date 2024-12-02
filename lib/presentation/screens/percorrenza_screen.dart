import 'package:d4m_new/presentation/widgets/card_car_widget.dart';
import 'package:d4m_new/presentation/widgets/percorrenza_km_widget.dart';
import 'package:flutter/material.dart';

class PercorrenzaAutoScreen extends StatefulWidget {
  const PercorrenzaAutoScreen({super.key, required this.listCard});

  final List<Map<String, String>> listCard;

  @override
  State<PercorrenzaAutoScreen> createState() => _PercorrenzaAuto();
}

class _PercorrenzaAuto extends State<PercorrenzaAutoScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 15,
        ),
        CardCarWidget(
          page: 'percorrenza',
          listCard: widget.listCard,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.listCard.length,
              itemBuilder: (context, index) {
                final item = widget.listCard[index];
                return PercorrenzaKmWidget(
                  dataKm: item['data'] ?? '',
                  type: item['tipo'] ?? '',
                  numKm: item['chilometri'] ?? '',
                  index: index,
                );
              }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
