// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServicesRecord> _$servicesRecordSerializer =
    new _$ServicesRecordSerializer();

class _$ServicesRecordSerializer
    implements StructuredSerializer<ServicesRecord> {
  @override
  final Iterable<Type> types = const [ServicesRecord, _$ServicesRecord];
  @override
  final String wireName = 'ServicesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServicesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.vehicle;
    if (value != null) {
      result
        ..add('vehicle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.service;
    if (value != null) {
      result
        ..add('service')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.shop;
    if (value != null) {
      result
        ..add('shop')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ownerName;
    if (value != null) {
      result
        ..add('ownerName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.carName;
    if (value != null) {
      result
        ..add('carName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.onHold;
    if (value != null) {
      result
        ..add('onHold')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.done;
    if (value != null) {
      result
        ..add('done')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('endDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.shopName;
    if (value != null) {
      result
        ..add('shopName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ServicesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServicesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vehicle':
          result.vehicle = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'service':
          result.service = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'shop':
          result.shop = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'notes':
          result.notes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'ownerName':
          result.ownerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'carName':
          result.carName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'onHold':
          result.onHold = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'done':
          result.done = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'shopName':
          result.shopName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ServicesRecord extends ServicesRecord {
  @override
  final DocumentReference<Object?>? vehicle;
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? service;
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? shop;
  @override
  final BuiltList<String>? notes;
  @override
  final String? ownerName;
  @override
  final String? carName;
  @override
  final bool? onHold;
  @override
  final bool? done;
  @override
  final DateTime? endDate;
  @override
  final String? shopName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ServicesRecord([void Function(ServicesRecordBuilder)? updates]) =>
      (new ServicesRecordBuilder()..update(updates))._build();

  _$ServicesRecord._(
      {this.vehicle,
      this.owner,
      this.service,
      this.date,
      this.shop,
      this.notes,
      this.ownerName,
      this.carName,
      this.onHold,
      this.done,
      this.endDate,
      this.shopName,
      this.ffRef})
      : super._();

  @override
  ServicesRecord rebuild(void Function(ServicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServicesRecordBuilder toBuilder() =>
      new ServicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServicesRecord &&
        vehicle == other.vehicle &&
        owner == other.owner &&
        service == other.service &&
        date == other.date &&
        shop == other.shop &&
        notes == other.notes &&
        ownerName == other.ownerName &&
        carName == other.carName &&
        onHold == other.onHold &&
        done == other.done &&
        endDate == other.endDate &&
        shopName == other.shopName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, vehicle.hashCode),
                                                    owner.hashCode),
                                                service.hashCode),
                                            date.hashCode),
                                        shop.hashCode),
                                    notes.hashCode),
                                ownerName.hashCode),
                            carName.hashCode),
                        onHold.hashCode),
                    done.hashCode),
                endDate.hashCode),
            shopName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServicesRecord')
          ..add('vehicle', vehicle)
          ..add('owner', owner)
          ..add('service', service)
          ..add('date', date)
          ..add('shop', shop)
          ..add('notes', notes)
          ..add('ownerName', ownerName)
          ..add('carName', carName)
          ..add('onHold', onHold)
          ..add('done', done)
          ..add('endDate', endDate)
          ..add('shopName', shopName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ServicesRecordBuilder
    implements Builder<ServicesRecord, ServicesRecordBuilder> {
  _$ServicesRecord? _$v;

  DocumentReference<Object?>? _vehicle;
  DocumentReference<Object?>? get vehicle => _$this._vehicle;
  set vehicle(DocumentReference<Object?>? vehicle) => _$this._vehicle = vehicle;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _service;
  String? get service => _$this._service;
  set service(String? service) => _$this._service = service;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _shop;
  DocumentReference<Object?>? get shop => _$this._shop;
  set shop(DocumentReference<Object?>? shop) => _$this._shop = shop;

  ListBuilder<String>? _notes;
  ListBuilder<String> get notes => _$this._notes ??= new ListBuilder<String>();
  set notes(ListBuilder<String>? notes) => _$this._notes = notes;

  String? _ownerName;
  String? get ownerName => _$this._ownerName;
  set ownerName(String? ownerName) => _$this._ownerName = ownerName;

  String? _carName;
  String? get carName => _$this._carName;
  set carName(String? carName) => _$this._carName = carName;

  bool? _onHold;
  bool? get onHold => _$this._onHold;
  set onHold(bool? onHold) => _$this._onHold = onHold;

  bool? _done;
  bool? get done => _$this._done;
  set done(bool? done) => _$this._done = done;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  String? _shopName;
  String? get shopName => _$this._shopName;
  set shopName(String? shopName) => _$this._shopName = shopName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ServicesRecordBuilder() {
    ServicesRecord._initializeBuilder(this);
  }

  ServicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vehicle = $v.vehicle;
      _owner = $v.owner;
      _service = $v.service;
      _date = $v.date;
      _shop = $v.shop;
      _notes = $v.notes?.toBuilder();
      _ownerName = $v.ownerName;
      _carName = $v.carName;
      _onHold = $v.onHold;
      _done = $v.done;
      _endDate = $v.endDate;
      _shopName = $v.shopName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServicesRecord;
  }

  @override
  void update(void Function(ServicesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServicesRecord build() => _build();

  _$ServicesRecord _build() {
    _$ServicesRecord _$result;
    try {
      _$result = _$v ??
          new _$ServicesRecord._(
              vehicle: vehicle,
              owner: owner,
              service: service,
              date: date,
              shop: shop,
              notes: _notes?.build(),
              ownerName: ownerName,
              carName: carName,
              onHold: onHold,
              done: done,
              endDate: endDate,
              shopName: shopName,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notes';
        _notes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServicesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
