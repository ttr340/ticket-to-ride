///
//  Generated code. Do not modify.
//  source: api.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class Code extends $pb.ProtobufEnum {
  static const Code UNSPECIFIED = const Code._(0, 'UNSPECIFIED');
  static const Code OK = const Code._(1, 'OK');
  static const Code INVALID_ARGUMENT = const Code._(2, 'INVALID_ARGUMENT');
  static const Code INTERNAL = const Code._(3, 'INTERNAL');
  static const Code UNAVAILABLE = const Code._(4, 'UNAVAILABLE');
  static const Code NOT_FOUND = const Code._(5, 'NOT_FOUND');
  static const Code ACCESS_DENIED = const Code._(6, 'ACCESS_DENIED');
  static const Code PING = const Code._(7, 'PING');
  static const Code FAILED_PRECONDITION = const Code._(8, 'FAILED_PRECONDITION');

  static const List<Code> values = const <Code> [
    UNSPECIFIED,
    OK,
    INVALID_ARGUMENT,
    INTERNAL,
    UNAVAILABLE,
    NOT_FOUND,
    ACCESS_DENIED,
    PING,
    FAILED_PRECONDITION,
  ];

  static final Map<int, Code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Code valueOf(int value) => _byValue[value];
  static void $checkItem(Code v) {
    if (v is! Code) $pb.checkItemFailed(v, 'Code');
  }

  const Code._(int v, String n) : super(v, n);
}

