import 'package:bary_solutions/widgets/menu_option_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart' as color;

class ProfileOptionsPage extends StatelessWidget {
  const ProfileOptionsPage({super.key});

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
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Icon(
                      CupertinoIcons.person_alt_circle,
                      size: 110,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Athos Roberto de Souza Pereira Portes',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
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
                          onTap: () => handleOpenToChangeProfilePhoto(context)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: MenuOptionWidget(
                          label: 'Remover foto perfil',
                          icon: CupertinoIcons.trash,
                          onTap: () {}),
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

  handleOpenToChangeProfilePhoto(context) {
    Get.bottomSheet(
      Container(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.1,
            // left: MediaQuery.of(context).size.height * 0.1,
            // right: MediaQuery.of(context).size.height * 0.1
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.camera_alt),
                label: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Tire uma foto'),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: color.primaryColor,
                    elevation: 0.0,
                    textStyle: TextStyle(
                      fontSize: 18,
                    )),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.1),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.photo),
                  label: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Escolha da galeria'),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color.primaryColor,
                      elevation: 0.0,
                      textStyle: TextStyle(
                        fontSize: 18,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(34))),
    );
  }
}
