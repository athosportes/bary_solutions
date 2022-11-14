import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/menu_option_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 64, bottom: 16, left: 16, right: 16),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _userInformations(),
                      _mainImage(),
                    ],
                  ),
                ),
                Divider(color: Colors.black),
                _menuOptions()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _menuOptions() {
    return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: MenuOptionWidget(
                        label: 'Ficha de vigilância epidemiológica',
                        icon: Icons.note_add_sharp),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: MenuOptionWidget(
                        label: 'Relatórios',
                        icon: Icons.pie_chart),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: MenuOptionWidget(
                        label: 'Cadastros',
                        icon: Icons.add_home_work_sharp),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: MenuOptionWidget(
                        label: 'Configurações',
                        icon: Icons.settings),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: MenuOptionWidget(
                        label: 'Sair',
                        icon: Icons.exit_to_app),
                  ),
                ],
              );
  }

  Row _userInformations() {
    return Row(
      children: [
        Icon(
          CupertinoIcons.person_alt_circle,
          size: 70,
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem vindo,',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Athos Portes',
              style: TextStyle(),
            )
          ],
        ),
      ],
    );
  }

  Image _mainImage() =>
      Image.asset('assets/images/logo.png', width: 100, height: 50);
}
