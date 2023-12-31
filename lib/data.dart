import 'package:flutter/material.dart';

class DProduk extends StatefulWidget {
  @override
  _DProdukState createState() => _DProdukState();
}

class _DProdukState extends State<DProduk> {
  TextEditingController _inputController = TextEditingController();
  final List<Widget> myList = [
    buildItem(1, 'Bando 1', 2000),
    buildItem(2, 'Bando 21', 6000),
    buildItem(3, 'Bando 32', 8000),
    buildItem(4, 'Bando 7', 10000),
    buildItem(5, 'Bando 35', 2000),
    buildItem(6, 'Bando 2', 3000),
    buildItem(7, 'Bando 20', 1000),
  ];

  static Widget buildItem(int index, String title, int price) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$index $title',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Harga: Rp. $price',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 50, 49, 49),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          title: Text('Data Produk'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _inputController,
                decoration: InputDecoration(
                    labelText: 'Filter Produk',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _inputController.clear();
                      },
                    )),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return myList[index];
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Access the input value using _inputController.text
            String inputValue = _inputController.text;
            print('Input Value: $inputValue');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
