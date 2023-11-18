// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:epp_firebase/components/text_component.dart';
import 'package:epp_firebase/model/mensagem.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../components/text_field_component.dart';
import '../../controller/login_controller.dart';
import 'login.dart';

class Cadastro extends StatefulWidget {

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

    var txtNome = TextEditingController();
    var txtSobrenome = TextEditingController();
    var txtEmail = TextEditingController();
    var txtUsuario = TextEditingController();
    var txtFaculdade = TextEditingController();
    var txtIdade = TextEditingController();
    var txtSenha = TextEditingController();
    var txtSenhaCheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 29, 109),
      appBar: AppBar(
        backgroundColor: Color(0xFF330E50),
        title: Text(
          "Cadastro",
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'Varela Round',
            ),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:() => Navigator.pop(context, false),
          ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: 
              Text(
                "Crie sua conta",
                style: TextStyle(
                  fontFamily: 'Varela Round',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Vamos precisar de algumas informações suas,",
              style: EstiloTexto.textoSimples,
              textAlign: TextAlign.center,
            ),
            Text(
              "preencha seus dados abaixo para começar.",
              style: EstiloTexto.textoSimples,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Column(
                children: [
                  TextFormFieldTxt(
                      labelText: "Nome",
                      controller: txtNome,
                      keyboardType: TextInputType.name, 
                      prefixIcon: Icons.person, 
                      textInputAction: TextInputAction.next, 
                      obscureText: false
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormFieldTxt(
                      labelText: "Sobrenome",
                      controller: txtSobrenome,
                      keyboardType: TextInputType.name, 
                      prefixIcon: Icons.person, 
                      textInputAction: TextInputAction.next, 
                      obscureText: false
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormFieldTxt(
                      labelText: "E-mail",
                      controller: txtEmail,
                      keyboardType: TextInputType.emailAddress, 
                      prefixIcon: Icons.email, 
                      textInputAction: TextInputAction.next, 
                      obscureText: false
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormFieldTxt(
                      labelText: "Nome de usuário",
                      controller: txtUsuario,
                      keyboardType: TextInputType.text, 
                      prefixIcon: Icons.person_pin, 
                      textInputAction: TextInputAction.next, 
                      obscureText: false
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormFieldTxt(
                      labelText: "Faculdade",
                      controller: txtFaculdade,
                      keyboardType: TextInputType.text, 
                      prefixIcon: Icons.school, 
                      textInputAction: TextInputAction.next, 
                      obscureText: false
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormFieldTxt(
                      labelText: "Idade",
                      controller: txtIdade,
                      keyboardType: TextInputType.number, 
                      prefixIcon: Icons.calendar_month, 
                      textInputAction: TextInputAction.next, 
                      obscureText: false
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormFieldTxt(
                      labelText: "Senha",
                      controller: txtSenha,
                      keyboardType: TextInputType.text, 
                      prefixIcon: Icons.lock, 
                      textInputAction: TextInputAction.next, 
                      obscureText: true
                  ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormFieldTxt(
                      labelText: "Confirmar Senha",
                      controller: txtSenhaCheck,
                      keyboardType: TextInputType.text, 
                      prefixIcon: Icons.lock, 
                      textInputAction: TextInputAction.done, 
                      obscureText: true
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      width: 300,
                      height: 5.5.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 108, 14, 180),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40)
                        ),
                        boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(
                                    0.0,
                                    0.0
                                  ),
                                  spreadRadius: 1.0,
                                  blurRadius: 7.0
                                ),
                              ],
                      ),
                      child: SizedBox(
                          child: (
                            TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Finalizar Cadastro",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Varela Round',
                                    fontSize: 24,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            onPressed: () {
                              String nome = txtNome.text;
                              String sobrenome = txtSobrenome.text;
                              String email = txtEmail.text;
                              String user = txtUsuario.text;
                              String facul = txtFaculdade.text;
                              String idade = txtIdade.text;
                              String senha = txtSenha.text;
                              String cSenha = txtSenhaCheck.text;
                              
                              if(nome.isEmpty||sobrenome.isEmpty||email.isEmpty||user.isEmpty||facul.isEmpty||idade.isEmpty||senha.isEmpty){
                                mensagemErro(context, "Por favor preencha os dados!");
                              }if(senha!=cSenha){
                                mensagemErro(context, "As senhas não coincidem!");
                                txtSenhaCheck.clear();
                              }else{
                                LoginController().criarConta(
                                context,
                                txtNome.text,
                                txtSobrenome.text,
                                txtEmail.text,
                                txtUsuario.text,
                                txtFaculdade.text,
                                txtIdade.text,
                                txtSenha.text,
                              );
                              }
                            },
                          )
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 235,
                    height: 5.5.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 141, 55, 207),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40)
                      ),
                      boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(
                                  0.0,
                                  0.0
                                ),
                                spreadRadius: 1.0,
                                blurRadius: 7.0
                              ),
                            ],
                    ),
                    child: SizedBox(
                        child: (
                          TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Cancelar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Já possui uma conta?",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Varela Round',
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        TextButton(
                          child: 
                          Text(
                            "Faça login",
                            style: TextStyle(
                             color: Color.fromARGB(255, 215, 171, 246),
                             fontFamily: 'Varela Round',
                             fontSize: 12.5.sp,
                             fontWeight: FontWeight.bold
                           ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   SizedBox(
                          child:
                              Text(
                                "Criando uma conta, você concorda com os nossos",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600
                                ),
                                textAlign: TextAlign.center,
                              ),
                  ),
                    TextButton(
                              child: 
                                Text(
                                  "Termos de Uso",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 215, 171, 246),
                                    fontFamily: 'Varela Round',
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                  onPressed: () {},
                   ),
                   SizedBox(
                    height: 20,
                   )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}