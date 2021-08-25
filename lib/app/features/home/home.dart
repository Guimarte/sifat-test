import 'package:flutter/material.dart';

import 'widgets/product_card.dart';

class Home extends StatelessWidget {
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
                      ),
                      Spacer(),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Unidade',
                        ),
                      ),
                      Spacer(),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Preço',
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      Spacer(),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
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
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ProductCardWidget(),
            ProductCardWidget(),
            ProductCardWidget(),
            ProductCardWidget()
          ],
        ),
      ),
    );
  }
}
