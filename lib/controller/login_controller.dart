// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/mensagem.dart';
import '../pages/bottom_pages/bottom_bar.dart';


class LoginController {

  criarConta(context, nome, sobrenome, email, usuario, faculdade, idade, senha) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    ).then((resultado) {
      FirebaseFirestore.instance.collection('usuarios').add({
         'uid': resultado.user!.uid,
         'nome': nome,
         'sobrenome': sobrenome,
         'nomeUsuario': usuario,
         'faculdade': faculdade,
         'idade': idade
      });
      mensagemSucesso(context, 'Usuário criado com sucesso!');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          mensagemErro(context, 'O email informado já foi cadastrado.');
          break;
        case 'invalid-email':
          mensagemErro(context, 'O email informado é inválido.');
          break;
        case 'empty-field':
          mensagemErro(context, 'Por favor, preencha os dados.');
        default:
          mensagemErro(context, 'ERRO: ${e.code.toString()}. Por favor verifique os dados.');
      }
    });
  }

  login(context, email, senha){
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: senha
      ).then((resultado){
        mensagemSucesso(context, "Usuário logado com sucesso!");
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => BottomBar(),
          ),
       );
      }).catchError((e){
        switch (e.code){
          case 'invalid-email':
            mensagemErro(context, 'E-mail inválido.'); break;
          case 'user-not-found':
            mensagemErro(context, 'Usúario não cadastrado.'); break;
          case 'wrong-password':
            mensagemErro(context, 'Senha incorreta.'); break;
          default:
            mensagemErro(context, 'ERRO: ${e.code.toString()}. Por favor verifique os dados.');
        }
      });
  }

  esqueceuSenha(context, String email){
    if(email.isNotEmpty){
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      mensagemSucesso(context, 'O e-mail foi enviado com sucesso!');
    }else{
      mensagemErro(context, 'Por favor, informe um e-mail para continuar!');
    }
    Navigator.pop(context);
  }

  logout(){
    FirebaseAuth.instance.signOut();
  }

  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }
  
  Future<String> usuarioLogado() async{
    var usuario = "";
    await FirebaseFirestore.instance
      .collection('usuarios')
      .where('uid', isEqualTo: idUsuario())
      .get()
      .then(
        (resultado){
          usuario = resultado.docs[0].data()['nome']?? '';
        },
      );
      return usuario;
  }

  Future<String> nomeUsuarioLogado() async{
    Future.delayed(Duration(seconds: 1));
    var nome = "";
    var sobre = "";
    await FirebaseFirestore.instance
      .collection('usuarios')
      .where('uid', isEqualTo: idUsuario())
      .get()
      .then(
        (resultado){
          nome = resultado.docs[0].data()['nome']?? '';
          sobre = resultado.docs[0].data()['sobrenome']?? '';
        },
      );
      return '$nome $sobre';
  }

  Future<String> userUsuarioLogado() async{
    var user = "";
    await FirebaseFirestore.instance
      .collection('usuarios')
      .where('uid', isEqualTo: idUsuario())
      .get()
      .then(
        (resultado){
          user = resultado.docs[0].data()['nomeUsuario']?? '';
        },
      );
      return '@$user';
  }

  Future<String> faculdadeUsuarioLogado() async{
    var facul = "";
    await FirebaseFirestore.instance
      .collection('usuarios')
      .where('uid', isEqualTo: idUsuario())
      .get()
      .then(
        (resultado){
          facul = resultado.docs[0].data()['faculdade']?? '';
        },
      );
      return facul;
  }

  Future<String> idadeUsuarioLogado() async{
    var idade = "";
    await FirebaseFirestore.instance
      .collection('usuarios')
      .where('uid', isEqualTo: idUsuario())
      .get()
      .then(
        (resultado){
          idade = resultado.docs[0].data()['idade']?? '';
        },
      );
      return '$idade anos';
  }

}