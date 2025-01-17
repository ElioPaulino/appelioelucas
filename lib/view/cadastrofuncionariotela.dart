import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroFuncionarioTela extends StatefulWidget {
  @override
  _CadastroFuncionarioTelaState createState() =>
      _CadastroFuncionarioTelaState();
}

class _CadastroFuncionarioTelaState extends State<CadastroFuncionarioTela> {
  var txtNome = TextEditingController();
  var txtCpfCnpj = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCelular = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtLogin = TextEditingController();
  var txtCargo = TextEditingController();
  var txtAtivo = TextEditingController();
  var txtSenha = TextEditingController();
  var txtSenhaConf = TextEditingController();
  var _formId = GlobalKey<FormState>();
  late String empresapessoa;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(40),
            child: Form(
              key: _formId,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment,
                    color: Colors.yellow,
                    size: 160,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: txtNome,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: "Informe o nome",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtCpfCnpj,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        labelText: 'Informe Cpf ou Cnpj',
                        labelStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtTelefone,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o telefone',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtCelular,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o celular',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtEndereco,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o endereço',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtCargo,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Cargo',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                                    TextField(
                    controller: txtAtivo,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Ativo',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtLogin,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o login',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenha,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe a senha',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenhaConf,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe a senha novamente',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.yellow.shade700;
                          return Colors.yellow.shade600;
                        },
                      )),
                      label: Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 24),
                      ),
                      icon: Icon(Icons.app_registration),
                      onPressed: () {
                          criarConta(
                            txtNome.text,
                            txtCpfCnpj.text,
                            txtTelefone.text,
                            txtCelular.text,
                            txtEndereco.text,
                            txtCargo.text,
                            txtAtivo.text,
                            txtLogin.text,
                            txtSenha.text,
                            txtSenhaConf.text
                            );

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Cadastro relizado com sucesso!!!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.yellow,
                        ));
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

void criarConta(nome, cpfcnpj, telefone,  celular, endereco, cargo, ativo, email, senha, senhaConf) {
    FirebaseAuth fa = FirebaseAuth.instance;

    fa
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
            var db = FirebaseFirestore.instance;
            db.collection('funcionarios').doc(resultado.user!.uid).set({
              'nome': nome,
              'cpfCnpj': cpfcnpj,
              'telefone': telefone,
              'celular': celular,
              'endereco': endereco,
              'cargo':cargo,
              'ativo':ativo
            }).then((valor) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Funcionário criado com sucesso.'),
                duration: Duration(seconds: 2),
              ));
              Navigator.pop(context);
            });
      
         }).catchError((erro) {
           var errorCode = erro.code;

      if (errorCode == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ERRO: O email informado já está em uso.'),
          duration: Duration(seconds: 2),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ERRO ${erro.message}'),
          duration: Duration(seconds: 2),
        ));
      }
    });
  }

}
