import 'package:d4m_new/business_logic/cubits/navigation_bottonbar_cubit.dart';
import 'package:d4m_new/presentation/screens/documenti_screen.dart';
import 'package:d4m_new/presentation/screens/help_desk_screen.dart';
import 'package:d4m_new/presentation/screens/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:d4m_new/presentation/screens/percorrenza_screen.dart';
import 'package:d4m_new/presentation/widgets/botton_bar_widget.dart';
import 'package:d4m_new/presentation/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.titleHome});

  final String titleHome;

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final List<Map<String, String>> listCard = [
    {
      'id': '0',
      'data': '01/01/2024',
      'tipo': 'DRIVERS',
      'chilometri': '12.333',
    },
    {
      'id': '1',
      'data': '05/01/2024',
      'tipo': 'AUTOMATICO',
      'chilometri': '10.222',
    },
    {
      'id': '2',
      'data': '05/01/2024',
      'tipo': 'AUTOMATICO',
      'chilometri': '2.233',
    },
    {'id': '3', 'data': '05/01/2024', 'tipo': 'DRIVERS', 'chilometri': '1.222'},
  ];

  Map<int, Map<String, dynamic>> get screensMap => {
        0: {
          'widget': HomeScreen(listCard: listCard),
          'title': widget.titleHome,
        },
        1: {
          'widget': const DocumentoScreen(),
          'title': 'Documenti',
        },
        2: {
          'widget': PercorrenzaAutoScreen(listCard: listCard),
          'title': 'Percorrenza',
        },
        3: {
          'widget': const HelpDeskScreen(),
          'title': 'Help Desk',
        },
      };

  final _formKey = GlobalKey<FormState>();
  final format = DateFormat.yMd();
  final TextEditingController _kmController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _kmController.dispose();
    _scrollController.dispose();
  }

  void _showInputDialog(
      BuildContext context, List<Map<String, String>> listCard) {
    ScaffoldMessenger.of(context).clearSnackBars();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Inserisci chilometri'),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Arrotondamento meno pronunciato
          ),
          content: Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _kmController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Questo campo non può essere vuoto';
                }
                final elemList = listCard.first['chilometri'] ?? '0';
                final number = double.tryParse(value);
                if (number == null) {
                  return 'Inserisci un numero valido';
                } else if (number < 0) {
                  return 'Questo campo non può essere negativo';
                } else if (number <= int.parse(elemList.replaceAll('.', ''))) {
                  return 'I chilometri sono minori o uguali ai precedenti';
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text("Chilometri"),
                hintText: "es 1500",
                prefixText: "Km ",
                isDense: false,
                errorStyle: TextStyle(),
                errorMaxLines: 2, // Limit error text to 1 line
              ),
            ),
          ),
          actions: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Posiziona i pulsanti
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 3.0,
                  color: Theme.of(context).colorScheme.primary,
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    onPressed: _insertKm,
                    child: Text(
                      "Crea",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                ),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary, width: 1),
                  ),
                  elevation: 3.0,
                  color: Theme.of(context).colorScheme.tertiary,
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    onPressed: () {
                      _kmController.clear();
                      Navigator.pop(context); // Chiude il dialog
                    },
                    child: Text(
                      "Annulla",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _insertKm() {
    try {
      final inputText = _kmController.text;
      if (inputText.length < 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inserisci almeno 3 cifre')),
        );
        return;
      }
      final text = '${inputText.substring(0, 2)}.${inputText.substring(2)}';

      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        setState(() {
          String formattedDate =
              DateFormat('MM/dd/yyyy').format(DateTime.now());
          listCard.insert(0, {
            'id': listCard.length.toString(),
            'data': formattedDate,
            'tipo': 'DRIVERS',
            'chilometri': text,
          });

          Future.delayed(const Duration(milliseconds: 100), () {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          });

          _kmController.clear();
          Navigator.pop(context);
        });
      }
    } catch (e) {
      debugPrint('Errore durante l\'inserimento dei chilometri: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (_) => NavigationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<NavigationCubit, Navigationbottombar>(
            builder: (context, state) {
              return Text(
                screensMap[state.indexPage]!['title'],
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
        body: BlocBuilder<NavigationCubit, Navigationbottombar>(
            builder: (context, state) {
          return screensMap[state.indexPage]!['widget'];
        }),
        drawer: const DrawerWidget(),
        bottomNavigationBar: const BottomBarWidget(),
        floatingActionButton: BlocBuilder<NavigationCubit, Navigationbottombar>(
          builder: (context, state) {
            return state.indexPage == 2
                ? FloatingActionButton(
                    shape: const CircleBorder(),
                    onPressed: () => _showInputDialog(context, listCard),
                    // Icona del FAB
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.tertiary,
                    ))
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
