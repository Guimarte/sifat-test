import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sifat_test/app/shared/repositories/product_repository.dart';

import 'cubit/productCubit.dart';
import 'widgets/product_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _nomeController = TextEditingController();
  final _unidadeController = TextEditingController();
  final _precoController = TextEditingController();

  final _cubit = HomeCubit()..getProducts();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Produtos"),
          actions: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 350,
                    child: Column(
                      children: [
                        Text(
                          "Adicionar Novo Produto",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome do Produto',
                          ),
                          controller: _nomeController,
                        ),
                        Spacer(),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Unidade',
                          ),
                          controller: _unidadeController,
                        ),
                        Spacer(),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Preço',
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: _precoController,
                        ),
                        Spacer(),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              ProductRepository().createProducts(
                                  nome: _nomeController.text,
                                  unidade: _unidadeController.text,
                                  preco: num.parse(_precoController.text));
                            },
                            child: Text("Salvar"),
                          ),
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: BlocConsumer<HomeCubit, List?>(
            bloc: _cubit,
            listener: (_, __) {},
            builder: (context, state) {
              if (state == [] || state == null) {
                return Container();
              }

              return Container(
                margin: EdgeInsets.all(20),
                child: Column(
                    children: state.map((e) {
                  return ProductCardWidget(
                      id: e["id"],
                      nome: e["nome"],
                      unidade: e["unidade"],
                      preco: e["preco"]);
                }).toList()),
              );
            }));
  }
}
