import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.surface,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 30), // Ridotto il padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Mario Rossi",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize),
                  ),
                  Text(
                    "mrossi@deloitte.it",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'DASHBORAD',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
              onTap: () {},
            ),
            // Divider
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            // Section: Documentation and FAQ
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'DOCUMENTAZIONE E FAQ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // ListTile for "Ricerca e distribuione in zona"
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Ricerca e distribuzione in zona',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'FAQ',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),

            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Ricera distribuzione in zona',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'HELP DESK',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Ticket',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'AUTO IN CORSO',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Delega -ZTL',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Percorrenza Autoveicolo',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Fuel CardS',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Revisioni',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Riepilogo Concur',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Multe',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'STORICO',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Storico Auto',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'CONFIGURAZIONE',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Storico di configurazioni',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'TELEMETRIA',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Telemetria Auto',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'STORICO SINISTRI',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 16),
              minTileHeight: 0,
              title: Text(
                'Sinistri',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
            // Divider
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'IMPOSTAZIONI',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30),
              minTileHeight: 0,
              title: Text(
                'Modifica impostazioni',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
