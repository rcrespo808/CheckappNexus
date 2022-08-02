import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vehicles_record.g.dart';

abstract class VehiclesRecord
    implements Built<VehiclesRecord, VehiclesRecordBuilder> {
  static Serializer<VehiclesRecord> get serializer =>
      _$vehiclesRecordSerializer;

  String? get plate;

  String? get make;

  String? get model;

  String? get color;

  String? get photo;

  DocumentReference? get userId;

  DateTime? get createdDate;

  String? get year;

  bool? get isVerified;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VehiclesRecordBuilder builder) => builder
    ..plate = ''
    ..make = ''
    ..model = ''
    ..color = ''
    ..photo = ''
    ..year = ''
    ..isVerified = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicles');

  static Stream<VehiclesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VehiclesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VehiclesRecord._();
  factory VehiclesRecord([void Function(VehiclesRecordBuilder) updates]) =
      _$VehiclesRecord;

  static VehiclesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVehiclesRecordData({
  String? plate,
  String? make,
  String? model,
  String? color,
  String? photo,
  DocumentReference? userId,
  DateTime? createdDate,
  String? year,
  bool? isVerified,
}) {
  final firestoreData = serializers.toFirestore(
    VehiclesRecord.serializer,
    VehiclesRecord(
      (v) => v
        ..plate = plate
        ..make = make
        ..model = model
        ..color = color
        ..photo = photo
        ..userId = userId
        ..createdDate = createdDate
        ..year = year
        ..isVerified = isVerified,
    ),
  );

  return firestoreData;
}
