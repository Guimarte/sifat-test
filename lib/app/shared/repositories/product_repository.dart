import 'package:dio/dio.dart';

class ProductRepository {
  final _dio = Dio();
  final _url = 'https://7e69-177-102-96-83.ngrok.io/products/';

  getProducts() async {
    try {
      final result = await _dio.get(_url);
      print(result);
      return result;
    } catch (e) {
      print(e);
    }
  }

  updateProducts({
    required String nome,
    required String unidade,
    required String preco,
    required int? id,
  }) async {
    try {
      final data = {
        "nome": nome,
        "unidade": unidade,
        "preco": num.parse(preco)
      };
      final result = await _dio.put(
        '$_url$id',
        data: data,
        queryParameters: {"id": id},
      );
      print(result);
      return result;
    } catch (e) {
      print(e);
    }
  }

  deleteProducts({required int? id}) async {
    try {
      final result = await _dio.delete('$_url$id');
      print(result);
      return result;
    } catch (e) {
      print(e);
    }
  }

  createProducts(
      {required String nome,
      required String unidade,
      required num preco}) async {
    try {
      final data = {"nome": nome, "unidade": unidade, "preco": preco};
      final result = await _dio.post(_url, data: data);
      print(result);
      return result;
    } catch (e) {
      print(e);
    }
  }
}
