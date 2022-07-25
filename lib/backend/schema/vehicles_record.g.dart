// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VehiclesRecord> _$vehiclesRecordSerializer =
    new _$VehiclesRecordSerializer();

class _$VehiclesRecordSerializer
    implements StructuredSerializer<VehiclesRecord> {
  @override
  final Iterable<Type> types = const [VehiclesRecord, _$VehiclesRecord];
  @override
  final String wireName = 'VehiclesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, VehiclesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.plate;
    if (value != null) {
      result
        ..add('plate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.make;
    if (value != null) {
      result
        ..add('make')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.model;
    if (value != null) {
      result
        ..add('model')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isVerified;
    if (value != null) {
      result
        ..add('isVerified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  VehiclesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VehiclesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'plate':
          result.plate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'make':
          result.make = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isVerified':
          result.isVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$VehiclesRecord extends VehiclesRecord {
  @override
  final String plate;
  @override
  final String make;
  @override
  final String model;
  @override
  final String color;
  @override
  final String photo;
  @override
  final DocumentReference<Object> userId;
  @override
  final DateTime createdDate;
  @override
  final String year;
  @override
  final bool isVerified;
  @override
  final DocumentReference<Object> reference;

  factory _$VehiclesRecord([void Function(VehiclesRecordBuilder) updates]) =>
      (new VehiclesRecordBuilder()..update(updates)).build();

  _$VehiclesRecord._(
      {this.plate,
      this.make,
      this.model,
      this.color,
      this.photo,
      this.userId,
      this.createdDate,
      this.year,
      this.isVerified,
      this.reference})
      : super._();

  @override
  VehiclesRecord rebuild(void Function(VehiclesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VehiclesRecordBuilder toBuilder() =>
      new VehiclesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VehiclesRecord &&
        plate == other.plate &&
        make == other.make &&
        model == other.model &&
        color == other.color &&
        photo == other.photo &&
        userId == other.userId &&
        createdDate == other.createdDate &&
        year == other.year &&
        isVerified == other.isVerified &&
        reference == other.reference;
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
                                $jc($jc($jc(0, plate.hashCode), make.hashCode),
                                    model.hashCode),
                                color.hashCode),
                            photo.hashCode),
                        userId.hashCode),
                    createdDate.hashCode),
                year.hashCode),
            isVerified.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VehiclesRecord')
          ..add('plate', plate)
          ..add('make', make)
          ..add('model', model)
          ..add('color', color)
          ..add('photo', photo)
          ..add('userId', userId)
          ..add('createdDate', createdDate)
          ..add('year', year)
          ..add('isVerified', isVerified)
          ..add('reference', reference))
        .toString();
  }
}

class VehiclesRecordBuilder
    implements Builder<VehiclesRecord, VehiclesRecordBuilder> {
  _$VehiclesRecord _$v;

  String _plate;
  String get plate => _$this._plate;
  set plate(String plate) => _$this._plate = plate;

  String _make;
  String get make => _$this._make;
  set make(String make) => _$this._make = make;

  String _model;
  String get model => _$this._model;
  set model(String model) => _$this._model = model;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  DocumentReference<Object> _userId;
  DocumentReference<Object> get userId => _$this._userId;
  set userId(DocumentReference<Object> userId) => _$this._userId = userId;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  String _year;
  String get year => _$this._year;
  set year(String year) => _$this._year = year;

  bool _isVerified;
  bool get isVerified => _$this._isVerified;
  set isVerified(bool isVerified) => _$this._isVerified = isVerified;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  VehiclesRecordBuilder() {
    VehiclesRecord._initializeBuilder(this);
  }

  VehiclesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _plate = $v.plate;
      _make = $v.make;
      _model = $v.model;
      _color = $v.color;
      _photo = $v.photo;
      _userId = $v.userId;
      _createdDate = $v.createdDate;
      _year = $v.year;
      _isVerified = $v.isVerified;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VehiclesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VehiclesRecord;
  }

  @override
  void update(void Function(VehiclesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VehiclesRecord build() {
    final _$result = _$v ??
        new _$VehiclesRecord._(
            plate: plate,
            make: make,
            model: model,
            color: color,
            photo: photo,
            userId: userId,
            createdDate: createdDate,
            year: year,
            isVerified: isVerified,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
