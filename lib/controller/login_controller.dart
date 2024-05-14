// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unnecessary_null_comparison, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epp/pages/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/mensagem.dart';
import '../pages/bottom_pages/bottom_bar.dart';
import '../services/firebase_service.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseService firebaseService = FirebaseService(firestore);

class LoginController {
  criarConta(
      context, nome, sobrenome, email, usuario, faculdade, idade, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    )
        .then((resultado) {
      FirebaseFirestore.instance.collection('usuarios').add({
        'uid': resultado.user!.uid,
        'nome': nome,
        'sobrenome': sobrenome,
        'nomeUsuario': usuario,
        'faculdade': faculdade,
        'idade': idade,
        'pontos': 0,
        'completouModuloUm': false
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
          mensagemErro(context,
              'ERRO: ${e.code.toString()}. Por favor verifique os dados.');
      }
    });
  }

  login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      mensagemSucesso(context, "Usuário logado com sucesso!");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(firebaseService: firebaseService,),
        ),
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => BottomBar(firebaseService: firebaseService)),
        (route) => false,
      );
      
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          mensagemErro(context, 'E-mail inválido.');
          break;
        case 'user-not-found':
          mensagemErro(context, 'Usúario não cadastrado.');
          break;
        case 'wrong-password':
          mensagemErro(context, 'Senha incorreta.');
          break;
        default:
          mensagemErro(context,
              'ERRO: ${e.code.toString()}. Por favor verifique os dados.');
      }
    });
  }

  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      mensagemSucesso(context, 'O e-mail foi enviado com sucesso!');
    } else {
      mensagemErro(context, 'Por favor, informe um e-mail para continuar!');
    }
    Navigator.pop(context);
  }

  logout(context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Login()),
        (route) => false,
      );
  }

  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> usuarioLogado() async {
    try {
      var usuario = "";
      await FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: idUsuario())
          .get()
          .then(
        (resultado) {
          usuario = resultado.docs[0].data()['nome'] ?? '';
        },
      );
      return usuario;
    } catch (e) {
      print(e);
      return 'Erro';
    }
  }

  Future<String> nomeUsuarioLogado() async {
    Future.delayed(Duration(seconds: 1));
    var nome = "";
    var sobre = "";
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        nome = resultado.docs[0].data()['nome'] ?? '';
        sobre = resultado.docs[0].data()['sobrenome'] ?? '';
      },
    );
    return '$nome $sobre';
  }

  Future<String> userUsuarioLogado() async {
    try {
      var user = "";
      var uid = idUsuario();
      print('UID do usuário: $uid');
      var resultado = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: uid)
          .get();

      if (resultado.docs.isNotEmpty) {
        var userData = resultado.docs[0].data();
        print('Dados do usuário: $userData');
        if (userData != null && userData.containsKey('nomeUsuario')) {
          user = userData['nomeUsuario'] ?? '';
        } else {
          print('Campo "nomeUsuario" não encontrado');
        }
      } else {
        print('Nenhum documento encontrado');
      }

      return '@$user';
    } catch (e) {
      print(e.toString());
      return 'Erro';
    }
  }

  Future<String> faculdadeUsuarioLogado() async {
    var facul = "";
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        facul = resultado.docs[0].data()['faculdade'] ?? '';
      },
    );
    return facul;
  }

  Future<String> idadeUsuarioLogado() async {
    var idade = "";
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        idade = resultado.docs[0].data()['idade'] ?? '';
      },
    );
    return '$idade anos';
  }

  Future<String> pontosUsuarioLogado() async {
    var pontos = "";
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        pontos = resultado.docs[0].data()['pontos'] ?? '';
      },
    );
    return pontos;
  }
}
