import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'services_record.g.dart';

abstract class ServicesRecord
    implements Built<ServicesRecord, ServicesRecordBuilder> {
  static Serializer<ServicesRecord> get serializer =>
      _$servicesRecordSerializer;

  DocumentReference? get vehicle;

  DocumentReference? get owner;

  String? get service;

  DateTime? get date;

  DocumentReference? get shop;

  BuiltList<String>? get notes;

  String? get ownerName;

  String? get carName;

  bool? get onHold;

  bool? get done;

  DateTime? get endDate;

  String? get shopName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ServicesRecordBuilder builder) => builder
    ..service = ''
    ..notes = ListBuilder()
    ..ownerName = ''
    ..carName = ''
    ..onHold = false
    ..done = false
    ..shopName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ServicesRecord._();
  factory ServicesRecord([void Function(ServicesRecordBuilder) updates]) =
      _$ServicesRecord;

  static ServicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createServicesRecordData({
  DocumentReference? vehicle,
  DocumentReference? owner,
  String? service,
  DateTime? date,
  DocumentReference? shop,
  String? ownerName,
  String? carName,
  bool? onHold,
  bool? done,
  DateTime? endDate,
  String? shopName,
}) {
  final firestoreData = serializers.toFirestore(
    ServicesRecord.serializer,
    ServicesRecord(
      (s) => s
        ..vehicle = vehicle
        ..owner = owner
        ..service = service
        ..date = date
        ..shop = shop
        ..notes = null
        ..ownerName = ownerName
        ..carName = carName
        ..onHold = onHold
        ..done = done
        ..endDate = endDate
        ..shopName = shopName,
    ),
  );

  return firestoreData;
}
