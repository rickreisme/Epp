import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerData {
  final String nome;
  final int pontos;
  int? posicao;

  PlayerData({
    required this.nome,
    required this.pontos,
    required this.posicao,
  });

  PlayerData copyWith({int? posicao}) {
    return PlayerData(
      nome: nome,
      pontos: pontos,
      posicao: posicao ?? this.posicao,
    );
  }
}

class FirebaseService {
  final FirebaseFirestore firestore;

  FirebaseService(this.firestore);

  Stream<List<PlayerData>> getPlayerDataList() {
    return firestore
        .collection('usuarios')
        .orderBy('pontos', descending: true)
        .snapshots()
        .map((querySnapshot) {
      var playerDataList = querySnapshot.docs.map((doc) {
        return PlayerData(
          nome: doc['nome'],
          pontos: doc['pontos'],
          posicao: null, // A posição será atribuída posteriormente
        );
      }).toList();

      // Atribui a posição de forma crescente com base na ordem dos documentos
      for (int i = 0; i < playerDataList.length; i++) {
        playerDataList[i] = playerDataList[i].copyWith(posicao: i + 1);
      }

      return playerDataList;
    });
  }
}