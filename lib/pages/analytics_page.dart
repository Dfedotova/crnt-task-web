import 'package:crnt_task/data/employees.dart';
import 'package:crnt_task/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  List<DataColumn> columns = [
    const DataColumn(label: Text('ФИО')),
    const DataColumn(label: Text('Направление')),
    const DataColumn(label: Text('Продолжительность работы')),
    const DataColumn(label: Text('Зарплата')),
    const DataColumn(label: Text('')),
  ];

  List<DataRow> _getRows() {
    final rows = <DataRow>[];
    for (var i = 0; i < allEmployees.length; i++) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Text('${allEmployees[i].surname} ${allEmployees[i].name}'),
            ),
            DataCell(
              Text(allEmployees[i].direction),
            ),
            DataCell(
              Text(
                (DateTime.now()
                            .difference(allEmployees[i].commencementDate)
                            .inDays /
                        365)
                    .toStringAsFixed(1),
              ),
            ),
            DataCell(
              Text(
                NumberFormat.compactSimpleCurrency(locale: 'ru-RU')
                    .format(allEmployees[i].earnedSalary),
              ),
            ),
            DataCell(
              SvgPicture.asset('assets/edit.svg'),
            ),
          ],
        ),
      );
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              FilterWidget(
                title: 'Сотрудники',
                filter: 'Все сотрудники',
                items: ['Федотова', 'Смирнов'],
              ),
              FilterWidget(
                title: 'Время',
                filter: 'Все время',
                items: ['Год', 'Месяц', 'Неделя'],
              ),
              FilterWidget(
                title: 'Направление',
                filter: 'Все направления',
                items: ['дизайн', 'програ'],
              ),
            ],
          ),
          const SizedBox(height: 60),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: columns,
                  rows: _getRows(),
                  dataTextStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.surfaceTint,
                  ),
                  headingTextStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.surfaceTint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
