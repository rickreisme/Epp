import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/anotacao.dart';
import '../model/lembrete.dart';
import '../model/mensagem.dart';
import 'login_controller.dart';

class AnotacaoController{

  void adicionar(context, Anotacao a){
    FirebaseFirestore.instance
    .collection('anotacoes')
    .add(a.toJson())
    .then((value) => mensagemSucesso(context,'Sua anotação foi adicionada com sucesso!'))
    .catchError((e) => mensagemErro(context, 'Não foi possível adicionar a sua anotação.'))
    .whenComplete(() => Navigator.pop(context));
  }

  void atualizar(context, id, Anotacao a){
    FirebaseFirestore.instance.collection('anotacoes')
    .doc(id)
    .update(a.toJson())
    .then((value) => mensagemSucesso(context, 'Sua anotação foi atualizada com sucesso!'))
    .catchError((e) => mensagemErro(context, 'Não foi possível atualizar a sua anotação.'))
    .whenComplete(() => Navigator.pop(context));
  }

   void excluir(context, id) {
    FirebaseFirestore.instance.collection('anotacoes')
    .doc(id)
    .delete()
    .then((value) => mensagemSucesso(context, 'Sua anotação foi excluída com sucesso!'))
    .catchError((e) => mensagemErro(context, 'Não foi possível excluir a sua anotação.'));
  }

  lista() {
    return FirebaseFirestore.instance
      .collection('anotacoes')
      .where('uid', isEqualTo: LoginController().idUsuario());
  }

  listaLembrete() {
    return FirebaseFirestore.instance
      .collection('lembretes')
      .where('uid', isEqualTo: LoginController().idUsuario());
  }

  void adicionarLembrete(context, Lembrete l){
    FirebaseFirestore.instance
    .collection('lembretes')
    .add(l.toJson())
    .then((value) => mensagemSucesso(context,'Lembrete adicionado com sucesso!'))
    .catchError((e) => mensagemErro(context, 'Não foi possível excluir o lembrete.'))
    .whenComplete(() => Navigator.pop(context));
  }

    void atualizarLembrete(context, id, Lembrete l){
    FirebaseFirestore.instance.collection('lembretes')
    .doc(id)
    .update(l.toJson())
    .then((value) => mensagemSucesso(context, 'Lembrete atualizado com sucesso!'))
    .catchError((e) => mensagemErro(context, 'Não foi possível atualizar o lembrete.'))
    .whenComplete(() => Navigator.pop(context));
  }

  void excluirLembrete(context, id) {
    FirebaseFirestore.instance.collection('lembretes')
    .doc(id)
    .delete()
    .then((value) => mensagemSucesso(context, 'Lembrete excluído com sucesso!'))
    .catchError((e) => mensagemErro(context, 'Não foi possível excluir a o lembrete.'));
  }

}