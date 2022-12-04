import 'package:flutter/material.dart';

import 'package:bary_solutions/pages/epidemiological_vigilance/epidemiological_vigilance_register/epidemiological_vigilance_register_controller.dart';
import 'package:bary_solutions/pages/epidemiological_vigilance/epidemiological_vigilance_view/epidemiological_vigilance_page_controller.dart';
import 'package:bary_solutions/pages/epidemiological_vigilance/widget/vigilance_option_widget.dart';
import 'package:bary_solutions/pages/epidemiological_vigilance/widget/filter_selector_widget.dart';
import 'package:bary_solutions/widgets/custom_elevated_button_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart' as color;

class EpidemiologialVigilanceRegisterPage
    extends GetView<EpidemiologicalVigilanceRegisterController> {
  final controller = Get.find<EpidemiologicalVigilanceRegisterController>();
  final _registerPageController = Get.find<EpidemiologicalVigilancePageController>();

  final _dateTime = DateTime.now();

  EpidemiologialVigilanceRegisterPage({super.key});
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
                Obx(() =>_dateAndUnitSelector(context)),
                SizedBox(height: 28),
                _menuOptions(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomElevatedButtonWidget(
          labelButton: 'Salvar',
          onPressed: () => controller.handleAddEpidemiologicalVigilance(),
        ),
      ),
    );
  }

  Column _menuOptions() {
    return Column(
      children: [
        VigilanceOptionWidget(
          title: 'Pacientes',
          controller: controller.patientsController.value,
        ),
        VigilanceOptionWidget(
          title: 'Admissões',
          controller: controller.admissionsController.value,
        ),
        VigilanceOptionWidget(
          title: 'SVD',
          controller: controller.svdController.value,
        ),
        VigilanceOptionWidget(
          title: 'CVC',
          controller: controller.cvcController.value,
        ),
        VigilanceOptionWidget(
          title: 'VM',
          controller: controller.vmController.value,
        ),
        VigilanceOptionWidget(
          title: 'NPP',
          controller: controller.nppController.value,
        ),
      ],
    );
  }

  Row _dateAndUnitSelector(BuildContext context) {
    initializeDateFormatting();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterSelectorWidget(
            onTap: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: _dateTime,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now());

              if (newDate == null) return;
              controller.date.value = newDate;
            },
            icon: Icons.calendar_month,
            // value: Text(DateFormat("d 'de' MMMM").format(e.date.value)),
            value: DateFormat("d 'de' MMMM").format(controller.date.value)),
        FilterSelectorWidget(
           onTap: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                builder: (context) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Obx(
                        () => !_registerPageController.loadingUnitList.value
                            ? ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                itemCount: _registerPageController.unitList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      _registerPageController.unitList
                                          .asMap()[index]!
                                          .descricao
                                          .toString(),
                                    ),
                                    subtitle: Text(_registerPageController.unitList
                                        .asMap()[index]!
                                        .tipoSetor),
                                  );
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                color: color.primaryColor,
                              )),
                      ),
                    ));
          },
          icon: CupertinoIcons.building_2_fill,
          value: 'Unidade de terapia intensiva',
        )
      ],
    );
  }
}
