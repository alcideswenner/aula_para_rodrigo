import 'package:aula2/Detalhes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> lista = ["maça", "pera"]; //
  TextEditingController controller = TextEditingController();
  late FocusNode focus;

  @override
  void initState() {
    super.initState();
    focus = FocusNode(); //instacinado
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override //0    //1
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        //widget de scrool
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                focusNode: focus,
                decoration: InputDecoration(hintText: "Digite uma fruta"),
                controller: controller,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              //scrool
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Detalhes(
                                fruta: lista[index],
                              ))),
                  title: Text(lista[index]),
                );
              },
              itemCount: lista.length,
            )
            //left: 20; right:20top:
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            lista.add(controller.text);
            print(lista);
            controller.clear();
            controller.text = "";
          });
        },
      ),
      bottomSheet: Container(
        color: Colors.blue,
        height: 30,
      ),
    );
  }
}
