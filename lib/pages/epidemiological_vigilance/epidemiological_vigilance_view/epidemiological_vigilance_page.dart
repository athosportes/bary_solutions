import 'package:bary_solutions/pages/epidemiological_vigilance/epidemiological_vigilance_view/epidemiological_vigilance_page_controller.dart';
import 'package:bary_solutions/pages/epidemiological_vigilance/widget/filter_selector_widget.dart';
import 'package:bary_solutions/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../constants/constants.dart' as color;

class EpidemiologicalVigilancePage extends StatelessWidget {
  EpidemiologicalVigilancePage({super.key});

  final EpidemiologicalVigilancePageController controller =
      Get.find<EpidemiologicalVigilancePageController>();

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
                Card(
                  child: ListTile(
                    // leading: FlutterLogo(size: 56.0),
                    title: Text('Two-line ListTile'),
                    subtitle: Text('Here is a second line'),
                    // trailing: Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.EPIDEMIOLOGICAL_VIGILANCE_REGISTER),
        // onPressed: () => controller.loadEpidemiologicalVigilanceList(),
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

            controller.setDate(newDate.toUtc());
            print(newDate);
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
                // isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                builder: (context) => Center(
                      child: Text('Texto'),
                    ));
          },
          icon: CupertinoIcons.building_2_fill,
          value: 'Unidade de terapia intensiva',
        )
      ],
    );
  }
}
