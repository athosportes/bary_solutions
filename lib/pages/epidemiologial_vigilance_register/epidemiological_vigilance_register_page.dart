import 'package:bary_solutions/pages/epidemiologial_vigilance_register/filter_selector_widget.dart';
import 'package:bary_solutions/pages/epidemiologial_vigilance_register/vigilance_option_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpidemiologialVigilanceRegisterPage extends StatefulWidget {
  const EpidemiologialVigilanceRegisterPage({super.key});

  @override
  State<EpidemiologialVigilanceRegisterPage> createState() =>
      _EpidemiologialVigilanceRegisterPageState();
}

class _EpidemiologialVigilanceRegisterPageState
    extends State<EpidemiologialVigilanceRegisterPage> {

  final _patientController = TextEditingController();
  ValueNotifier _patientNotifier = ValueNotifier<String>('0');

  TextEditingController _admissionsController = TextEditingController();
  ValueNotifier _admissionsNotifier = ValueNotifier<String>('0');

  TextEditingController _svdController = TextEditingController();
  ValueNotifier _svdNotifier = ValueNotifier<String>('0');

  TextEditingController _cvcController = TextEditingController();
  ValueNotifier _cvcNotifier = ValueNotifier<String>('0');

  TextEditingController _vmController = TextEditingController();
  ValueNotifier _vmNotifier = ValueNotifier<String>('0');

  TextEditingController _nppController = TextEditingController();
  ValueNotifier _nppNotifier = ValueNotifier<String>('0');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ficha de vigilância epidemiológica'),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _dateAndUnitSelector(context),
                  SizedBox(height: 28),
                  _menuOptions(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('')],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Column _menuOptions() {
    return Column(
      children: [
        VigilanceOptionWidget(
          title: 'Pacientes',
          listenable: _patientNotifier,
          controller: _patientController,
        ),
        VigilanceOptionWidget(
          title: 'Admissões',
          listenable: _admissionsNotifier,
          controller: _admissionsController,
        ),
        VigilanceOptionWidget(
          title: 'SVD',
          listenable: _svdNotifier,
          controller: _svdController,
        ),
        VigilanceOptionWidget(
          title: 'CVC',
          listenable: _cvcNotifier,
          controller: _cvcController,
        ),
        VigilanceOptionWidget(
          title: 'VM',
          listenable: _vmNotifier,
          controller: _vmController,
        ),
        VigilanceOptionWidget(
          title: 'NPP',
          listenable: _nppNotifier,
          controller: _nppController,
        ),
      ],
    );
  }

  Row _dateAndUnitSelector(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterSelectorWidget(
          onTap: () {
            print(MediaQuery.of(context).size.aspectRatio);
          },
          icon: Icons.calendar_month,
          value: '3 de novembro',
        ),
        FilterSelectorWidget(
          onTap: () {},
          icon: CupertinoIcons.building_2_fill,
          value: 'Unidade de terapia intensiva',
        )
      ],
    );
  }
}
