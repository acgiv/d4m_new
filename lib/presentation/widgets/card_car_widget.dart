import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CardCarWidget extends StatefulWidget {
  const CardCarWidget({super.key, required this.page, required this.listCard});

  final String page;
  final int totalMax = 35000;
  final List<Map<String, String>> listCard;

  @override
  State<CardCarWidget> createState() => _CardCarState();
}

class _CardCarState extends State<CardCarWidget> {
  double getPercentual() {
    final elemList = widget.listCard.first['chilometri'] ?? '0';
    final num = int.tryParse(elemList.replaceAll('.', '')) ?? 0;
    return (num / widget.totalMax);
  }

  getBar(BuildContext context) {
    final percento = getPercentual();
    return Row(children: [
      Expanded(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
                height: 18,
                child: LinearPercentIndicator(
                    lineHeight: 40.0,
                    barRadius: const Radius.circular(20.0),
                    percent: percento <= 1.0 ? percento : 1.0,
                    animation: true,
                    trailing: Text(
                      '${widget.totalMax} km',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                      textAlign: TextAlign.center,
                    ),
                    animationDuration: 1000,
                    center: Text(
                      '${(percento * 100).toStringAsFixed(2)} %',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    progressColor: percento <= 1.0
                        ? Theme.of(context).colorScheme.primary
                        : Colors.red))),
      ),
      const SizedBox(
        width: 10,
      )
    ]);
  }

  getKmPercorrenza(BuildContext context) {
    return Row(
      children: [
        SvgIcon(
          icon: const SvgIconData(
              'assets/images/svg/ico_percorrenza_cerchio.svg'),
          size: 34,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Km attuali',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromRGBO(167, 168, 170, 1),
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              '35.000',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.left,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: SizedBox(
          width: 350,
          height: widget.page != 'home' ? 270 : 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 12, left: 16),
                  child: Text(
                    'MERCEDES BENZ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(167, 168, 170, 1),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: Text(
                    'MERCEDES-BENZ GLE 350 DE 4MATIC EQ-POWER Premium',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                      height: 130,
                      child: Image.asset(
                        'assets/images/png/auto.png',
                        fit: BoxFit.fill,
                      )),
                  Column(
                    children: [
                      const Text(
                        'Targa Attuale',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromRGBO(167, 168, 170, 1),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Stack(
                        alignment:
                            Alignment.center, // Centra il testo sull'immagine
                        children: [
                          // L'immagine di sfondo
                          Image.asset(
                            'assets/images/png/targa.png',
                            width: 99,
                            fit: BoxFit.contain,
                          ),
                          const Text(
                            'GD724TH',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (widget.page == 'home') getKmPercorrenza(context)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              if (widget.page != 'home') getBar(context)
            ],
          ),
        ),
      ),
    );
  }
}
