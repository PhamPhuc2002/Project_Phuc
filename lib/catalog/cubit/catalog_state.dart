part of 'catalog_cubit.dart';

@immutable
abstract class CatalogState extends Equatable {}

class LoadingCatalog extends CatalogState {
  @override
  List<Object?> get props => [];
}

class LoadedCatalog extends CatalogState {
  LoadedCatalog(this.itemList);
  final List<Item> itemList;
  @override
  List<Object?> get props => [itemList];
}

class ErrorLoadingCatalog extends CatalogState {
  @override
  List<Object?> get props => [];
}
