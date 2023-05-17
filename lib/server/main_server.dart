import 'package:grpc/grpc.dart';
import 'package:fields_grcp/server/service.dart';

Future<void> main() async {
  final server = Server([FieldService()]);
  await server.serve(port: 8080);
  print('Server listening on port ${server.port}');
}
