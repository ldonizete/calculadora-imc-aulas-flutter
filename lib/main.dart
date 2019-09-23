import 'package:calculadora_imc/pessoa.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int groupValue;
  var genero;

  Pessoa pessoa = new Pessoa();

  String _result, _imcTexto = "";

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _weightController.text = '';
    _heightController.text = '';
    pessoa.cor = Colors.black;
    setState(() {
      _result = 'Informe seus dados';
      _imcTexto = "";
    });
  }

  void mudarRadio(int valor)
  {
    setState(() {
      if(valor==0)
      {
        groupValue = 0;
        genero = "masculino";
      }
      else
      {
        groupValue = 1;
        genero = "feminino";
      }
    });
  }

  void calculateImc(String genero) 
  {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100.0;
    
    pessoa.calculoIMC(weight, height, genero);

    setState(() {
      _result = pessoa.classificacao;
      _imcTexto = pessoa.imcResult;
    });
  }

  @override
  Widget build(BuildContext context) 
  {    
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.blue,
        actions: <Widget>
        [
          IconButton
          (
            icon: Icon(Icons.refresh),
            onPressed: () 
            {
              resetFields();
            },
          )
        ],
      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView
      (
        padding: EdgeInsets.all(20.0),
        child: Form(
        key: _formKey,
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>
          [
            TextFormField
            (
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              controller: _weightController,
              validator: (text) 
              {
                return text.isEmpty ? "Insira seu peso!" : null;
              },
            ),
            TextFormField
            (
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (cm)'),
              controller: _heightController,
              validator: (text) 
              {
                return text.isEmpty ? "Insira sua altura!" : null;
              },
            ),
            new Row
            (
              mainAxisAlignment: MainAxisAlignment.start,
              children: 
              [
                new Radio
                (
                  value: 0,
                  activeColor: Colors.black,
                  groupValue: groupValue,
                  onChanged: (int valor) => mudarRadio(valor),
                ),
                new Text
                (
                  'Masculino',
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio
                (
                  value: 1,
                  activeColor: Colors.black,
                  groupValue: groupValue,
                  onChanged: (int valor) => mudarRadio(valor),
                ),
                new Text
                (
                  'Feminino',
                  style: new TextStyle(fontSize: 16.0),
                ),
              ]
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(_imcTexto != "" ? _imcTexto : "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: pessoa.cor)),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(_result, style: TextStyle(color: pessoa.cor, fontSize: 16))
            ]),
            Padding
            (
              padding: EdgeInsets.symmetric(vertical: 36.0),
              child: Container(
              height: 50,
              child: RaisedButton
              (
                color: Colors.blueAccent,
                onPressed: () 
                {
                  if (_formKey.currentState.validate()) 
                  {
                    calculateImc(genero);
                  }
                },
                child: Text('CALCULAR', style: TextStyle(color: Colors.white)),
              ))),
          ],
    ))));
  }
}


