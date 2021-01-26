// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomePageMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on _HomePageMobx, Store {
  final _$newsListAtom = Atom(name: '_HomePageMobx.newsList');

  @override
  List<Article> get newsList {
    _$newsListAtom.context.enforceReadPolicy(_$newsListAtom);
    _$newsListAtom.reportObserved();
    return super.newsList;
  }

  @override
  set newsList(List<Article> value) {
    _$newsListAtom.context.conditionallyRunInAction(() {
      super.newsList = value;
      _$newsListAtom.reportChanged();
    }, _$newsListAtom, name: '${_$newsListAtom.name}_set');
  }

  final _$loaderAtom = Atom(name: '_HomePageMobx.loader');

  @override
  bool get loader {
    _$loaderAtom.context.enforceReadPolicy(_$loaderAtom);
    _$loaderAtom.reportObserved();
    return super.loader;
  }

  @override
  set loader(bool value) {
    _$loaderAtom.context.conditionallyRunInAction(() {
      super.loader = value;
      _$loaderAtom.reportChanged();
    }, _$loaderAtom, name: '${_$loaderAtom.name}_set');
  }

  final _$getNewsAsyncAction = AsyncAction('getNews');

  @override
  Future<void> getNews(String url) {
    return _$getNewsAsyncAction.run(() => super.getNews(url));
  }

  @override
  String toString() {
    final string =
        'newsList: ${newsList.toString()},loader: ${loader.toString()}';
    return '{$string}';
  }
}
