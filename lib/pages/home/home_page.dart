import 'package:flutter/material.dart';

import 'package:bary_solutions/routes/app_pages.dart';
import 'package:bary_solutions/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../widgets/menu_option_widget.dart';

class HomePage extends StatefulWidget {
  final _authService = Get.find<AuthService>();
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    widget._authService.checkUserHasEstablishment();
  }

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
              onTap: () => Get.toNamed(Routes.EPIDEMIOLOGICAL_VIGILANCE),
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
            onTap: () => widget._authService.checkUserHasEstablishment(),
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

  Widget _userInformations() {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: () => Get.toNamed(Routes.PROFILE_OPTIONS),
          child: Ink(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(),
              ),
              width: 90,
              height: 90,
              child: Container(
                // child: _profilePictureLoad(),
                child: Center(),
              ),
            ),
          ),
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
            Obx(() => Text(
                  widget._authService.userInformations.value!.nome,
                  style: TextStyle(),
                ))
          ],
        ),
      ],
    );
  }

  Image _mainImage() =>
      Image.asset('assets/images/logo.png', width: 100, height: 50);
}
