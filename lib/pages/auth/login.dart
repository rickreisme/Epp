// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace

import 'package:epp_firebase/components/text_field_component.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/button_component.dart';
import '../../controller/login_controller.dart';
import '../../model/mensagem.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                    left: 40,
                    right: 40,
                  ),
                  child: SizedBox(
                    width: 40.h,
                    height: 40.w,
                    child: Image.asset("assets/img/Logo.png"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 45,
                    left: 40,
                    right: 40,
                  ),
                  child: Text(
                    "Bem-vindo(a) ao E++",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontFamily: 'Varela Round',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: Text(
                    "Faça login ou cadastre-se para ter acesso as atividades e conteúdos do app.",
                    style: TextStyle(
                      color: Color(0xFFCCB9B9),
                      fontSize: 16.sp,
                      fontFamily: 'Varela Round',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                //caixa roxa de login
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 70.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(41),
                        ),
                        color: Color(0xFF72399D),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          TextFormFieldLogin(
                              labelText: "E-mail",
                              controller: txtEmail,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icons.email,
                              textInputAction: TextInputAction.next,
                              obscureText: false),
                          SizedBox(
                            height: 18,
                          ),
                          TextFormFieldLogin(
                              labelText: "Senha",
                              controller: txtSenha,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icons.lock,
                              textInputAction: TextInputAction.done,
                              obscureText: true),
                          SizedBox(
                            height: 3,
                          ),
                          Esqueceu(),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 330,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Color(0xFF330E50),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: SizedBox(
                              child: (TextButton(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Entrar",
                                      style: TextStyle(
                                        color: Color(0xFFBFB9B9),
                                        fontFamily: 'Varela Round',
                                        fontSize: 24,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  String email = txtEmail.text;
                                  String senha = txtSenha.text;

                                  if (email.isEmpty || senha.isEmpty) {
                                    mensagemErro(context,
                                        "Por favor preencha todos os dados!");
                                  } else {
                                    LoginController().login(
                                      context,
                                      txtEmail.text,
                                      txtSenha.text,
                                    );
                                  }
                                },
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          AindaNao(),
                          SizedBox(height: 10),
                          OuEntre(),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: Color(0xFF330E50),
                                    size: 25.sp,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: FaIcon(
                                    FontAwesomeIcons.google,
                                    color: Color(0xFF330E50),
                                    size: 25.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            child: Text(
                              "Ao criar uma conta você concorda com os nossos",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "Termos de Uso",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 215, 171, 246),
                                  fontFamily: 'Varela Round',
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
