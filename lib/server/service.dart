import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:grpc/grpc.dart';
import 'package:fields_grcp/src/protos/fields.pbgrpc.dart';

class FieldService extends FieldServiceBase {
  @override
  Future<FieldResponse> getFields(ServiceCall call,
      FieldRequest request) async {
    final data = request.data;
    final result = await getData(data);
    final message = '${result.name}\n${result.area}\n${result.azot}\n${result.bal}\n'
        '${result.gumus}\n${result.kaliy}\n${result.pH}\n${result
        .phosfor}\n${result.val1}\n'
        '${result.val2}\n${result.val3}\n${result.val4}\n${result.val5}\n${result.val6}\n${result.val7}';
    return FieldResponse()
      ..message = message;
  }

  Future<FieldData> getData(String value) async {
    final input = File('lib/assets/fields.csv').openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter(
      fieldDelimiter: ';',
      textDelimiter: '"',
    )).toList();
    for (final row in fields) {
      final name = row[0].toString();
      if (name == value) {
        return FieldData(
          name: row[0].toString(),
          area: row[1].toString().replaceAll(',', '.'),
          azot: row[2].toString().replaceAll(',', '.'),
          bal: row[3].toString().replaceAll(',', '.'),
          gumus: row[4].toString().replaceAll(',', '.'),
          kaliy: row[5].toString().replaceAll(',', '.'),
          pH: row[6].toString().replaceAll(',', '.'),
          phosfor: row[7].toString().replaceAll(',', '.'),
          val1: row[8].toString().replaceAll(',', '.'),
          val2: row[9].toString().replaceAll(',', '.'),
          val3: row[10].toString().replaceAll(',', '.'),
          val4: row[11].toString().replaceAll(',', '.'),
          val5: row[12].toString().replaceAll(',', '.'),
          val6: row[13].toString().replaceAll(',', '.'),
          val7: row[14].toString().replaceAll(',', '.'),
        );
      }
    }
    return const FieldData(name: '', area: '',
        azot: '', bal: '',
        gumus: '', kaliy: '',
        pH: '', phosfor: '',
        val1: '', val2: '',
        val3: '', val4: '',
        val5: '', val6:'',
        val7: '');
  }


  double parseDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else {
      return 0.0;
    }
  }

  int parseInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String) {
      return int.tryParse(value) ?? 0;
    } else {
      return 0;
    }
  }
}
  class FieldData{
  final String name;
  final String area;
  final String bal;
  final String pH;
  final String gumus;
  final String azot;
  final String phosfor;
  final String kaliy;
  final String val1;
  final String val2;
  final String val3;
  final String val4;
  final String val5;
  final String val6;
  final String val7;
  const FieldData(
      {required this.name,
        required this.area,
        required this.azot,
        required this.bal,
        required this.gumus,
        required this.kaliy,
        required this.pH,
        required this.phosfor,
        required this.val1,
        required this.val2,
        required this.val3,
        required this.val4,
        required this.val5,
        required this.val6,
        required this.val7});
}
