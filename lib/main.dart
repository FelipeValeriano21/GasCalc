import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 
void main() {
 
  runApp(const MyWidget());
 
}
 
class MyWidget extends StatefulWidget {
 
  const MyWidget ({super.key});
 
 
  @override
 
  State <MyWidget> createState() => _MyWidgetState();
}
 
class _MyWidgetState extends State <MyWidget> {
 
  String _info = "Informe os seus dados";
 
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
  TextEditingController etanolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
 
  void _resetFields() {
 
    etanolController.text = "";
    etanolController.text = "";
 
    setState(() {
 
      _info = "Informe os seus dados.";
      _formKey = GlobalKey<FormState>();
 
    });
  }
 
  void _calcular() {
 
    setState(() {
 
      double etanol = double.parse(etanolController.text) * 0.7;
 
      double gasolina = double.parse(gasolinaController.text) ;

 
  
 
      if(etanol <= gasolina) {
 
        _info =  'Compensa usar gasolina pois vai render (${gasolina.toStringAsPrecision(3)})' ;
 
      }else{

        _info =  'Compensa usar etanol pois vai render (${etanol.toStringAsPrecision(3)})' ;

      }
 
    });

  }
 
  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
 
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Gasolina ou Etanol"),
          centerTitle: false,
          backgroundColor: Color.fromARGB(255, 233, 167, 26),    
          actions: <Widget>[
            IconButton(onPressed: _resetFields, icon: const Icon(Icons.update))
          ],
        ),
 
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                const Icon (Icons.gas_meter_outlined,
                size: 120.0, color: Color.fromARGB(255, 234, 180, 88)),
                TextFormField(
 
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
 
                    labelText: "Quantidade em litros de Etanol",
                    labelStyle: TextStyle(color:Color.fromARGB(255, 0, 0, 0)),
                  ),
 
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25.0,),
                  controller: etanolController,
                  validator: (value) {
 
                    if(value!.isEmpty) {
 
                      return 'Insira o etanol';
                   
                    }
 
                    return null;
 
                  },
 
                ),
 
                TextFormField(
 
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Quantidade em litros de Gasolina",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
 
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25.0),
                  controller: gasolinaController,
                  validator: (value) {
 
                    if(value!.isEmpty) {
 
                      return 'Insira a gasolina';
 
                    }
 
                      return null;
                  },
 
                ),
 
                Padding(
 
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _calcular();
                      }
                    },
 
                    child: const Text (
 
                      'Verificar',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25.0),
                      

                            
 
                  )
                  ),
                ),
 
                Text(
                  _info,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                )
              ]
            ),
          ),
        ),
 
      )
 
    );
 
 
  }
 
}
 