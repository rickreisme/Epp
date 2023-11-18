import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/editar.dart';
import '../model/mensagem.dart';

class EditarController{

  void atualizar(context, id, Editar e){
    FirebaseFirestore.instance.collection('usuarios')
    .doc(id)
    .update(e.toJson())
    .then((value) => mensagemSucesso(context, 'Seus dados foram atualizados com sucesso!'))
    .catchError((e) => mensagemErro(context, 'Não foi possível atualizar os seus dados.'))
    .whenComplete(() => Navigator.pop(context));
  }

}