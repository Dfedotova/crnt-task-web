import 'package:crnt_task/controllers/analytics_controller.dart';
import 'package:crnt_task/data/employees.dart';
import 'package:crnt_task/models/employee.dart';
import 'package:crnt_task/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  final analyticsController = Get.put(AnalyticsController());
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  final RxString _chartTypeSelected = 'line'.obs;

  List<DataColumn> columns = [
    const DataColumn(label: Text('ФИО')),
    const DataColumn(label: Text('Направление')),
    const DataColumn(label: Text('Продолжительность работы')),
    const DataColumn(label: Text('Зарплата')),
  ];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      analyticsController.filteredEmployees
        ..clear()
        ..addAll(allEmployees);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      analyticsController.loadTable();
    });
  }

  List<DataRow> _getRows(List<Employee> employees) {
    final rows = <DataRow>[];
    for (var i = 0; i < employees.length; i++) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Text('${employees[i].surname} ${employees[i].name}'),
            ),
            DataCell(
              Text(employees[i].direction),
            ),
            DataCell(
              Text(
                (DateTime.now()
                            .difference(employees[i].commencementDate)
                            .inDays /
                        365)
                    .toStringAsFixed(1),
              ),
            ),
            DataCell(
              Text(
                NumberFormat.compactSimpleCurrency(locale: 'ru-RU')
                    .format(employees[i].earnedSalary),
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }

  static List<PieSeries<Employee, String>> _getPieChartData(
    List<Employee> employees,
  ) {
    return <PieSeries<Employee, String>>[
      PieSeries<Employee, String>(
        dataSource: employees,
        xValueMapper: (employee, _) => '${employee.surname}\n${employee.name}',
        yValueMapper: (employee, _) => employee.earnedSalary,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
        dataLabelMapper: (employee, _) => employee.surname,
        enableTooltip: true,
      ),
    ];
  }

  static List<LineSeries<Employee, String>> _getLineChartData(
    List<Employee> employees,
  ) {
    return <LineSeries<Employee, String>>[
      LineSeries<Employee, String>(
        dataSource: employees,
        xValueMapper: (employee, _) => '${employee.surname}\n${employee.name}',
        yValueMapper: (employee, _) => employee.earnedSalary,
      ),
    ];
  }

  static List<ChartSeries<Employee, String>> _getBarChartData(
    List<Employee> employees,
  ) {
    return <ChartSeries<Employee, String>>[
      ColumnSeries<Employee, String>(
        dataSource: employees,
        xValueMapper: (employee, _) => '${employee.surname}\n${employee.name}',
        yValueMapper: (employee, _) => employee.earnedSalary,
      ),
    ];
  }

  Widget _chartWidget(String theme, Color color) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
      label: Text(
        theme,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
        ),
      ),
      backgroundColor: color,
    );
  }

  Widget _currentChartType(String typeRU, String typeEN) {
    return GestureDetector(
      child: _chartWidget(
        typeRU,
        _chartTypeSelected.value == typeEN
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.shadow,
      ),
      onTap: () {
        if (_chartTypeSelected.value != typeEN) {
          _chartTypeSelected.value = typeEN;
        }
      },
    );
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
                title: 'Направление',
                filter: 'Все направления',
                items: const [
                  'Все направления',
                  'Управление',
                  'Видеопродакшен',
                  'Дизайн',
                  'Методология',
                  'Разработка',
                ],
                onFilterChanged: analyticsController.onDirectionFilterUpdated,
              ),
              Obx(
                () => Wrap(
                  spacing: 10,
                  children: [
                    _currentChartType('линейный', 'line'),
                    _currentChartType('круговой', 'circle'),
                    _currentChartType('столбчатый', 'bar'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Expanded(
            child: Obx(() {
              final loading = analyticsController.loading.value;
              final filteredEmployees = analyticsController.filteredEmployees;
              if (loading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView(
                  children: [
                    if (_chartTypeSelected.value == 'line') ...[
                      SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: _getLineChartData(filteredEmployees),
                      )
                    ] else if (_chartTypeSelected.value == 'circle') ...[
                      SfCircularChart(
                        series: _getPieChartData(filteredEmployees),
                        tooltipBehavior: _tooltipBehavior,
                      )
                    ] else if (_chartTypeSelected.value == 'bar') ...[
                      SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: _getBarChartData(filteredEmployees),
                      )
                    ],
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: DataTable(
                        columns: columns,
                        rows: _getRows(filteredEmployees),
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
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
