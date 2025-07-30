///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsVi extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsVi _root = this; // ignore: unused_field

	@override 
	TranslationsVi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsVi(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppVi app = _TranslationsAppVi._(_root);
	@override late final _TranslationsCommonVi common = _TranslationsCommonVi._(_root);
	@override late final _TranslationsThemeVi theme = _TranslationsThemeVi._(_root);
	@override late final _TranslationsLanguageVi language = _TranslationsLanguageVi._(_root);
	@override late final _TranslationsHomeVi home = _TranslationsHomeVi._(_root);
}

// Path: app
class _TranslationsAppVi extends TranslationsAppEn {
	_TranslationsAppVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ứng dụng Base';
	@override String get welcome => 'Chào mừng đến với Ứng dụng Base';
}

// Path: common
class _TranslationsCommonVi extends TranslationsCommonEn {
	_TranslationsCommonVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get ok => 'Đồng ý';
	@override String get cancel => 'Hủy';
	@override String get save => 'Lưu';
	@override String get delete => 'Xóa';
	@override String get edit => 'Chỉnh sửa';
	@override String get loading => 'Đang tải...';
	@override String get error => 'Lỗi';
	@override String get success => 'Thành công';
	@override String get retry => 'Thử lại';
	@override String get close => 'Đóng';
}

// Path: theme
class _TranslationsThemeVi extends TranslationsThemeEn {
	_TranslationsThemeVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Giao diện';
	@override String get light => 'Sáng';
	@override String get dark => 'Tối';
	@override String get system => 'Hệ thống';
}

// Path: language
class _TranslationsLanguageVi extends TranslationsLanguageEn {
	_TranslationsLanguageVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cài đặt Ngôn ngữ';
	@override String get english => 'English';
	@override String get vietnamese => 'Tiếng Việt';
	@override String get current => 'Ngôn ngữ hiện tại';
	@override String get select => 'Chọn ngôn ngữ';
}

// Path: home
class _TranslationsHomeVi extends TranslationsHomeEn {
	_TranslationsHomeVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trang chủ';
	@override String greeting({required Object Name}) => 'Xin chào, ${Name}!';
	@override String get description => 'Đây là ứng dụng Flutter mẫu với bản địa hóa slang.';
}
