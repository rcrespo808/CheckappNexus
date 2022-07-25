import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'services_record.g.dart';

abstract class ServicesRecord
    implements Built<ServicesRecord, ServicesRecordBuilder> {
  static Serializer<ServicesRecord> get serializer =>
      _$servicesRecordSerializer;

  @nullable
  DocumentReference get vehicle;

  @nullable
  DocumentReference get owner;

  @nullable
  String get service;

  @nullable
  DateTime get date;

  @nullable
  DocumentReference get shop;

  @nullable
  BuiltList<String> get notes;

  @nullable
  String get ownerName;

  @nullable
  String get carName;

  @nullable
  bool get onHold;

  @nullable
  bool get done;

  @nullable
  DateTime get endDate;

  @nullable
  String get shopName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

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
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ServicesRecord._();
  factory ServicesRecord([void Function(ServicesRecordBuilder) updates]) =
      _$ServicesRecord;

  static ServicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createServicesRecordData({
  DocumentReference vehicle,
  DocumentReference owner,
  String service,
  DateTime date,
  DocumentReference shop,
  String ownerName,
  String carName,
  bool onHold,
  bool done,
  DateTime endDate,
  String shopName,
}) =>
    serializers.toFirestore(
        ServicesRecord.serializer,
        ServicesRecord((s) => s
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
          ..shopName = shopName));
