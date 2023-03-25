import 'package:crnt_task/data/employees.dart';
import 'package:crnt_task/models/employee.dart';
import 'package:crnt_task/utils/get_directions.dart';
import 'package:crnt_task/utils/get_employees.dart';
import 'package:crnt_task/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  //RxBool _isEditable = false.obs;

  List<DataColumn> columns = [
    const DataColumn(label: Text('ФИО')),
    const DataColumn(label: Text('Направление')),
    const DataColumn(label: Text('Продолжительность работы')),
    const DataColumn(label: Text('Зарплата')),
    //const DataColumn(label: Text('')),
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
            /*DataCell(
              GestureDetector(
                onTap: () => _isEditable.value = !_isEditable.value,
                child: SvgPicture.asset('assets/edit.svg'),
              ),
            ),*/
          ],
        ),
      );
    }
    return rows;
  }

  static List<LineSeries<Employee, String>> _getDefaultData() {
    final chartData = allEmployees;
    return <LineSeries<Employee, String>>[
      LineSeries<Employee, String>(
        dataSource: chartData,
        xValueMapper: (employee, _) => '${employee.surname}\n${employee.name}',
        yValueMapper: (employee, _) => employee.earnedSalary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 100, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FilterWidget(
                title: 'Сотрудники',
                filter: 'Все сотрудники',
                items: getEmployees(),
              ),
              const FilterWidget(
                title: 'Время',
                filter: 'Все время',
                items: [
                  'Все время',
                  'Год',
                  'Месяц',
                  'Неделя',
                ],
              ),
              FilterWidget(
                title: 'Направление',
                filter: 'Все направления',
                items: getDirections(),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Expanded(
            child: ListView(
              children: [
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: _getDefaultData(),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: DataTable(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
