// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ShopsRecord> _$shopsRecordSerializer = new _$ShopsRecordSerializer();

class _$ShopsRecordSerializer implements StructuredSerializer<ShopsRecord> {
  @override
  final Iterable<Type> types = const [ShopsRecord, _$ShopsRecord];
  @override
  final String wireName = 'ShopsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ShopsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.services;
    if (value != null) {
      result
        ..add('services')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.addressText;
    if (value != null) {
      result
        ..add('addressText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.showItem;
    if (value != null) {
      result
        ..add('showItem')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  ShopsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShopsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'banner':
          result.banner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'addressText':
          result.addressText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'showItem':
          result.showItem = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$ShopsRecord extends ShopsRecord {
  @override
  final String logo;
  @override
  final String banner;
  @override
  final String name;
  @override
  final String description;
  @override
  final LatLng address;
  @override
  final BuiltList<String> services;
  @override
  final String addressText;
  @override
  final bool showItem;
  @override
  final DocumentReference<Object> userId;
  @override
  final DocumentReference<Object> reference;

  factory _$ShopsRecord([void Function(ShopsRecordBuilder) updates]) =>
      (new ShopsRecordBuilder()..update(updates)).build();

  _$ShopsRecord._(
      {this.logo,
      this.banner,
      this.name,
      this.description,
      this.address,
      this.services,
      this.addressText,
      this.showItem,
      this.userId,
      this.reference})
      : super._();

  @override
  ShopsRecord rebuild(void Function(ShopsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShopsRecordBuilder toBuilder() => new ShopsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShopsRecord &&
        logo == other.logo &&
        banner == other.banner &&
        name == other.name &&
        description == other.description &&
        address == other.address &&
        services == other.services &&
        addressText == other.addressText &&
        showItem == other.showItem &&
        userId == other.userId &&
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
                                $jc($jc($jc(0, logo.hashCode), banner.hashCode),
                                    name.hashCode),
                                description.hashCode),
                            address.hashCode),
                        services.hashCode),
                    addressText.hashCode),
                showItem.hashCode),
            userId.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShopsRecord')
          ..add('logo', logo)
          ..add('banner', banner)
          ..add('name', name)
          ..add('description', description)
          ..add('address', address)
          ..add('services', services)
          ..add('addressText', addressText)
          ..add('showItem', showItem)
          ..add('userId', userId)
          ..add('reference', reference))
        .toString();
  }
}

class ShopsRecordBuilder implements Builder<ShopsRecord, ShopsRecordBuilder> {
  _$ShopsRecord _$v;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  LatLng _address;
  LatLng get address => _$this._address;
  set address(LatLng address) => _$this._address = address;

  ListBuilder<String> _services;
  ListBuilder<String> get services =>
      _$this._services ??= new ListBuilder<String>();
  set services(ListBuilder<String> services) => _$this._services = services;

  String _addressText;
  String get addressText => _$this._addressText;
  set addressText(String addressText) => _$this._addressText = addressText;

  bool _showItem;
  bool get showItem => _$this._showItem;
  set showItem(bool showItem) => _$this._showItem = showItem;

  DocumentReference<Object> _userId;
  DocumentReference<Object> get userId => _$this._userId;
  set userId(DocumentReference<Object> userId) => _$this._userId = userId;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ShopsRecordBuilder() {
    ShopsRecord._initializeBuilder(this);
  }

  ShopsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _logo = $v.logo;
      _banner = $v.banner;
      _name = $v.name;
      _description = $v.description;
      _address = $v.address;
      _services = $v.services?.toBuilder();
      _addressText = $v.addressText;
      _showItem = $v.showItem;
      _userId = $v.userId;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShopsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShopsRecord;
  }

  @override
  void update(void Function(ShopsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShopsRecord build() {
    _$ShopsRecord _$result;
    try {
      _$result = _$v ??
          new _$ShopsRecord._(
              logo: logo,
              banner: banner,
              name: name,
              description: description,
              address: address,
              services: _services?.build(),
              addressText: addressText,
              showItem: showItem,
              userId: userId,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'services';
        _services?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ShopsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
