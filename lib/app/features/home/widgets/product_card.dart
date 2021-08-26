import 'package:flutter/material.dart';
import 'package:sifat_test/app/shared/repositories/product_repository.dart';

class ProductCardWidget extends StatefulWidget {
  final int? id;

  const ProductCardWidget(
      {Key? key,
      required this.nome,
      required this.unidade,
      required this.preco,
      required this.id})
      : super(key: key);

  final dynamic nome;
  final dynamic unidade;
  final dynamic preco;

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  final _nomeController = TextEditingController();
  final _unidadeController = TextEditingController();
  final _precoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        title: Row(
          children: [
            Text(
              "${widget.nome}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "${widget.unidade}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "${widget.preco}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            IconButton(
              onPressed: () {
                ProductRepository().deleteProducts(id: widget.id);
              },
              icon: Icon(Icons.delete),
            ),
            Spacer(),
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
                              ProductRepository().updateProducts(
                                  id: widget.id,
                                  nome: _nomeController.text,
                                  preco: _precoController.text,
                                  unidade: _unidadeController.text);
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
              icon: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
