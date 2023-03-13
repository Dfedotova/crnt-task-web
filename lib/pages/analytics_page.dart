import 'package:crnt_task/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  List<DataRow> rows = [
    DataRow(
      cells: [
        const DataCell(Text('Иванов Иван Иванович')),
        const DataCell(Text('DSGN')),
        const DataCell(Text('1.8')),
        const DataCell(Text('130 000')),
        DataCell(SvgPicture.asset('assets/edit.svg')),
      ],
    ),
    DataRow(
      cells: [
        const DataCell(Text('Петров Александр Иванович')),
        const DataCell(Text('JVDVP')),
        const DataCell(Text('2.5')),
        const DataCell(Text('50 000')),
        DataCell(SvgPicture.asset('assets/edit.svg')),
      ],
    ),
    DataRow(
      cells: [
        const DataCell(Text('Харитонова Мария Витальевна')),
        const DataCell(Text('PM')),
        const DataCell(Text('0.8')),
        const DataCell(Text('60 000')),
        DataCell(SvgPicture.asset('assets/edit.svg')),
      ],
    ),
  ];

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
              ),
              FilterWidget(
                title: 'Время',
                filter: 'Все время',
              ),
              FilterWidget(
                title: 'Направление',
                filter: 'Все направления',
              ),
            ],
          ),
          const SizedBox(height: 60),
          DataTable(
            columns: columns,
            rows: rows,
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
    );
  }
}
