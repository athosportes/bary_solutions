import 'package:bary_solutions/routes/app_pages.dart';
import 'package:bary_solutions/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/menu_option_widget.dart';

class HomePage extends StatefulWidget {
  final _authService = Get.find<AuthService>();

  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              onTap: () =>
                  Get.toNamed(Routes.EPIDEMIOLOGICAL_VIGILANCE_REGISTER),
              label: 'Ficha de vigilância epidemiológica',
              icon: Icons.note_add_sharp),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: MenuOptionWidget(
            onTap: () {},
            label: 'Relatórios',
            icon: Icons.pie_chart,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: MenuOptionWidget(
            onTap: () {},
            label: 'Cadastros',
            icon: Icons.add_home_work_sharp,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: MenuOptionWidget(
            onTap: () {},
            label: 'Configurações',
            icon: Icons.settings,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: MenuOptionWidget(
            onTap: () => widget._authService.logout(),
            label: 'Sair',
            icon: Icons.exit_to_app,
          ),
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
