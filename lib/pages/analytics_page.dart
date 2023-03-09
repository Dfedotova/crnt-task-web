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
        DataCell(Text('Иванов Иван Иванович')),
        DataCell(Text('DSGN')),
        DataCell(Text('1.8')),
        DataCell(Text('130 000')),
        DataCell(SvgPicture.asset('assets/edit.svg')),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text('Петров Александр Иванович')),
        DataCell(Text('JVDVP')),
        DataCell(Text('2.5')),
        DataCell(Text('50 000')),
        DataCell(SvgPicture.asset('assets/edit.svg')),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text('Харитонова Мария Витальевна')),
        DataCell(Text('PM')),
        DataCell(Text('0.8')),
        DataCell(Text('60 000')),
        DataCell(SvgPicture.asset('assets/edit.svg')),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: DataTable(
        columns: columns,
        rows: rows,
        dataTextStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        headingTextStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
