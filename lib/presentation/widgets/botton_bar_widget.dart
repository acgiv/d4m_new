import 'package:d4m_new/business_logic/cubits/navigation_bottonbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomItemWidget();
}

class _BottomItemWidget extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .primary, // Colore del bordo superiore
            width: 4.0, // Larghezza del bordo
          ),
        ),
      ),
      child: BlocBuilder<NavigationCubit, Navigationbottombar>(
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (index) {
              BlocProvider.of<NavigationCubit>(context).selectPage(index);
            },
            currentIndex: state.indexPage,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  activeIcon: SvgIcon(
                    icon: const SvgIconData('assets/images/svg/ico_home.svg'),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  icon: const SvgIcon(
                      icon: SvgIconData('assets/images/svg/ico_home.svg')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  activeIcon: SvgIcon(
                    icon: const SvgIconData(
                        'assets/images/svg/ico_documenti.svg'),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  icon: const SvgIcon(
                      icon: SvgIconData('assets/images/svg/ico_documenti.svg')),
                  label: 'Documenti'),
              BottomNavigationBarItem(
                  activeIcon: SvgIcon(
                    icon: const SvgIconData(
                        'assets/images/svg/ico_percorrenza.svg'),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  icon: const SvgIcon(
                      icon:
                          SvgIconData('assets/images/svg/ico_percorrenza.svg')),
                  label: 'Percorrenza'),
              BottomNavigationBarItem(
                  activeIcon: SvgIcon(
                    icon:
                        const SvgIconData('assets/images/svg/ico_helpdesk.svg'),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  icon: const SvgIcon(
                      icon: SvgIconData('assets/images/svg/ico_helpdesk.svg')),
                  label: 'Help Desk'),
            ],
          );
        },
      ),
    );
  }
}
