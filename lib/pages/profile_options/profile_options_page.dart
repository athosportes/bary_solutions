import 'package:bary_solutions/services/auth_service.dart';
import 'package:bary_solutions/services/storage_service.dart';
import 'package:flutter/material.dart';

import 'package:bary_solutions/widgets/menu_option_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart' as color;

class ProfileOptionsPage extends StatelessWidget {
  final _authService = Get.find<AuthService>();
  final _storageService = Get.find<StorageService>();

  ProfileOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // border: Border.all(),
                      ),
                      width: 250,
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: _authService.haveProfilePhoto.value
                            ? Image.network(_authService.profilePhotoUrl.value)
                            : Icon(
                                CupertinoIcons.person_alt_circle,
                                size: 110,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Athos Roberto de Souza Pereira Portes',
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(_authService.user.email.toString())
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: MenuOptionWidget(
                          label: 'Alterar foto perfil',
                          icon: Icons.photo,
                          onTap: () =>_storageService.pickAndUploadImage()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: MenuOptionWidget(
                        label: 'Remover foto perfil',
                        icon: CupertinoIcons.trash,
                        onTap: () {
                          print(_authService.getProfilePhoto());
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: MenuOptionWidget(
                          label: 'Alterar senha',
                          icon: Icons.key,
                          onTap: () {}),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
