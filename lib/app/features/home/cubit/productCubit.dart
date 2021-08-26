import 'package:bloc/bloc.dart';
import 'package:sifat_test/app/shared/repositories/product_repository.dart';

class HomeCubit extends Cubit<List?> {
  HomeCubit() : super([]);

  void getProducts() async {
    try {
      final products = await ProductRepository().getProducts();
      emit(products.data);
    } catch (err) {
      print(err);
    }
  }
}
