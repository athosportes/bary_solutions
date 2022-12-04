import 'package:flutter/material.dart';

import 'package:bary_solutions/pages/epidemiological_vigilance/widget/filter_selector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart' as color;

class DateUnitSelectorWidget extends StatelessWidget {
  final dynamic dateTime;
  final bool? loading;
  final int itemCount;
  final dynamic unitList;
  final Function() onTap;

  DateUnitSelectorWidget({
    super.key,
    required this.dateTime,
    this.loading = false,
    required this.itemCount,
    required this.unitList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterSelectorWidget(
          onTap: onTap,
          icon: Icons.calendar_month,
          // value: DateFormat("d 'de' MMMM").format(_dateTime),
          value: DateFormat("d 'de' MMMM").format(dateTime),
        ),
        FilterSelectorWidget(
          onTap: () {
            showModalBottomSheet(
                context: context,
                // isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                builder: (context) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Obx(
                        () => !loading!
                            ? ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                itemCount: itemCount,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      unitList
                                          .asMap()[index]!
                                          .descricao
                                          .toString(),
                                    ),
                                    subtitle: Text(
                                        unitList.asMap()[index]!.tipoSetor),
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
          value: 'Setor',
        )
      ],
    );
  }
}
