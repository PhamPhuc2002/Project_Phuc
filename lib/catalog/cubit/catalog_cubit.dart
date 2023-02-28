import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_cart_cubit/catalog/models/item.dart';
import 'package:shopping_cart_cubit/repository.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit({required this.repository}) : super(LoadingCatalog()) {
    getData();
  }

  final Repository repository;

  getData() async {
    emit(LoadingCatalog());
    try {
      final data = await repository.getProduct();
      emit(LoadedCatalog(data));
      print('Loading data sucess');
    } catch (e) {
      //emit(ErrorLoadingCatalog());
      print('Loading data error');
    }
  }
}
