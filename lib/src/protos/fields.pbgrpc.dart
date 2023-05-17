///
//  Generated code. Do not modify.
//  source: protos/fields.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'fields.pb.dart' as $0;
export 'fields.pb.dart';

class FieldServiceClient extends $grpc.Client {
  static final _$getFields =
      $grpc.ClientMethod<$0.FieldRequest, $0.FieldResponse>(
          '/FieldService/GetFields',
          ($0.FieldRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FieldResponse.fromBuffer(value));

  FieldServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.FieldResponse> getFields($0.FieldRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFields, request, options: options);
  }
}

abstract class FieldServiceBase extends $grpc.Service {
  $core.String get $name => 'FieldService';

  FieldServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FieldRequest, $0.FieldResponse>(
        'GetFields',
        getFields_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FieldRequest.fromBuffer(value),
        ($0.FieldResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FieldResponse> getFields_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FieldRequest> request) async {
    return getFields(call, await request);
  }

  $async.Future<$0.FieldResponse> getFields(
      $grpc.ServiceCall call, $0.FieldRequest request);
}
