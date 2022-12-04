import 'package:flutter/material.dart';

import 'package:bary_solutions/pages/epidemiological_vigilance/epidemiological_vigilance_view/epidemiological_vigilance_page_controller.dart';
import 'package:bary_solutions/pages/epidemiological_vigilance/widget/filter_selector_widget.dart';
import 'package:bary_solutions/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart' as color;

class EpidemiologicalVigilancePage extends StatefulWidget {
  EpidemiologicalVigilancePage({super.key});

  @override
  State<EpidemiologicalVigilancePage> createState() =>
      _EpidemiologicalVigilancePageState();
}

class _EpidemiologicalVigilancePageState
    extends State<EpidemiologicalVigilancePage> {
  final EpidemiologicalVigilancePageController _controller =
      Get.find<EpidemiologicalVigilancePageController>();

  @override
  void initState() {
    _controller.loadUnits();
    _controller.loadEpidemiologicalVigilanceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha de vigilância epidemiológica'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: _dateAndUnitSelector(context),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Obx(
                () => !_controller.loadingEpidemiologicalList.value
                    ? ListView.builder(
                        itemCount: _controller.epidemiologicalList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.all(4),
                            elevation: 3,
                            child: ListTile(
                              title: Text(
                                _controller.epidemiologicalList
                                    .asMap()[index]!
                                    .dataRegistro
                                    .toString(),
                              ),
                              subtitle: Text('oi'),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        color: color.primaryColor,
                      )),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.EPIDEMIOLOGICAL_VIGILANCE_REGISTER),
        backgroundColor: color.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Row _dateAndUnitSelector(BuildContext context) {
    initializeDateFormatting();
    DateTime _dateTime = DateTime.now();

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

            // _controller.setDate(newDate.toUtc());
            // controller.setDate(newDate);
            // controller.date.value = newDate as TextEditingController ;
          },
          icon: Icons.calendar_month,
          // value: DateFormat("d 'de' MMMM").format(_dateTime),
          value: 'Novembro / 2022',
        ),
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
                        () => !_controller.loadingUnitList.value
                            ? ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                itemCount: _controller.unitList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      _controller.unitList
                                          .asMap()[index]!
                                          .descricao
                                          .toString(),
                                    ),
                                    subtitle: Text(_controller.unitList
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
