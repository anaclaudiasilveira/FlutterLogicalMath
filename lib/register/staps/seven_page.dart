import 'package:flutter/material.dart';
//import 'package:maths/register/staps/seven_page.dart';
import 'package:maths/validation.dart';
import 'package:maths/register/model/register_model.dart';

class SevenPage extends StatefulWidget {
  const SevenPage({Key? key}) : super(key: key);

  @override
  State<SevenPage> createState() => _SevenPageState();
}

class _SevenPageState extends State<SevenPage> {
  final Validation validar = Validation();
  final _formKey = GlobalKey<FormState>();
  final RegisterModel usuario = RegisterModel();
  final resposta7 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    resposta7.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Desafio 7'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
                key: this._formKey,
                child: Container(
                    //padding: EdgeInsets.all(10.0),
                    child: Column(
                  children: [
                    Container(
                      child: Image.asset('assets/images/25a.jpg'),
                      width: 300,
                      height: 300,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(100, 30, 100, 30),
                      child: TextFormField(
                        controller: resposta7,
                        decoration: InputDecoration(
                          label: Text('Resposta'),
                          hintText: 'Digite sua resposta e tecle OK',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.1,
                                  color: Colors.green,
                                  style: BorderStyle.solid)),
                        ),
                        validator: (resposta7) =>
                            validar.resposta7(resposta7.toString()),
                        onSaved: (String? resposta7) {
                          usuario.resposta7 = resposta7 as int?;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('OK'),
                      onPressed: () {
                        _onSubmit(context);
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        child: Text('Pr??ximo desafio'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SevenPage()));
                        }),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Sair'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    )
                  ],
                )))));
  }

  void _onSubmit(inContext) {
    if (_formKey.currentState!.validate()) {
      print('Formul??rio Validado!');
      // Salva os dados preenchido no formul??rio atrav??s
      // das propriedades onSaved de cada campo do formul??rio
      _formKey.currentState!.save();
      // chama a rota nomeada enviando enviando os dados do usu??rio
      // s?? que agora os dados do usu??rio s??o enviados
      // como argumentos da rota
      Navigator.of(inContext).pushNamed('/jogo7', arguments: usuario);
      // Navigator.of(inContext)
      //     .pushNamed(RegisterModel(resposta7: int), arguments: usuario);
    } else {
      print('********* Formul??rio de valida????o de resposta. ********');
      showDialog(
        context: inContext,
        barrierDismissible: false,
        builder: (inContext) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('N??o entrou com nenhuma resposta!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(inContext);
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(inContext);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}