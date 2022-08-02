import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shops_record.g.dart';

abstract class ShopsRecord implements Built<ShopsRecord, ShopsRecordBuilder> {
  static Serializer<ShopsRecord> get serializer => _$shopsRecordSerializer;

  String? get logo;

  String? get banner;

  String? get name;

  String? get description;

  LatLng? get address;

  BuiltList<String>? get services;

  String? get addressText;

  bool? get showItem;

  DocumentReference? get userId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ShopsRecordBuilder builder) => builder
    ..logo = ''
    ..banner = ''
    ..name = ''
    ..description = ''
    ..services = ListBuilder()
    ..addressText = ''
    ..showItem = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shops');

  static Stream<ShopsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ShopsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ShopsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => ShopsRecord(
        (c) => c
          ..logo = snapshot.data['logo']
          ..banner = snapshot.data['banner']
          ..name = snapshot.data['name']
          ..description = snapshot.data['description']
          ..address = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..services = safeGet(() => ListBuilder(snapshot.data['services']))
          ..addressText = snapshot.data['addressText']
          ..showItem = snapshot.data['showItem']
          ..userId = safeGet(() => toRef(snapshot.data['userId']))
          ..ffRef = ShopsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ShopsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'shops',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ShopsRecord._();
  factory ShopsRecord([void Function(ShopsRecordBuilder) updates]) =
      _$ShopsRecord;

  static ShopsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createShopsRecordData({
  String? logo,
  String? banner,
  String? name,
  String? description,
  LatLng? address,
  String? addressText,
  bool? showItem,
  DocumentReference? userId,
}) {
  final firestoreData = serializers.toFirestore(
    ShopsRecord.serializer,
    ShopsRecord(
      (s) => s
        ..logo = logo
        ..banner = banner
        ..name = name
        ..description = description
        ..address = address
        ..services = null
        ..addressText = addressText
        ..showItem = showItem
        ..userId = userId,
    ),
  );

  return firestoreData;
}
