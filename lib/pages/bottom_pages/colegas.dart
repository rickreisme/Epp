// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers


import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../controller/login_controller.dart';
import '../auth/login.dart';
import '../basic/configs.dart';
import '../basic/notifications.dart';

class Colegas extends StatelessWidget {

  final snackbar2 = SnackBar(
    content: Text("Colega adicionado com sucesso!"),
    backgroundColor: Color.fromARGB(255, 88, 39, 125),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView(
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, right: 14),
                  child: FutureBuilder<String>(
                    future: LoginController().usuarioLogado(),
                    builder: (context, snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return Directionality(
                          textDirection: TextDirection.rtl, 
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'Varela Round',
                              color: Color(0xFF5F1796),
                              fontWeight: FontWeight.w600
                            )
                          ),
                          onPressed:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => Login(),
                              ),
                            );
                            LoginController().logout();
                          },
                          icon: Icon(Icons.exit_to_app, size: 20),
                          label: Text(snapshot.data.toString()),
                          ),
                        );
                      }
                      return Text('');
                    }
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Colegas",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Varela Round',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  color: Color(0xFF5F1796),
                  icon: SizedBox(
                  height: 55,
                  width: 55,
                    child: Icon(
                      Icons.notifications,
                      size: 33,
                    ),
                  ),
                  onPressed:() {
                    Navigator.push(
                      context,
                        MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                        ),
                      );
                  }, 
                ),
                IconButton(
                  color: Color(0xFF5F1796),
                  icon: SizedBox(
                    height: 41,
                    width: 41,
                    child: Icon(
                        Icons.settings,
                        size: 33,
                      ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => HomePageConfigs(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                            width: 43.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 88, 39, 125),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF3A224B),
                                  spreadRadius: 2,
                                  offset: Offset(-2, 0)
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 79,
                                        height: 79,
                                        margin: EdgeInsets.only(top: 15),
                                        child: Image.asset(
                                          "assets/img/sara.png"
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Sara Parker",
                                          style: TextStyle(
                                           fontSize: 14.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Fatec Ribeirão Preto",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Ranking Prata",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(snackbar2);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 3, right: 3),
                                          width: 43.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 65, 10, 107),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF3A224B),
                                                spreadRadius: 2,
                                                offset: Offset(-2, 0)
                                              )
                                            ]
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.person_add,
                                                  color: Colors.white,
                                                  size: 30,
                                                  ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "adicionar",
                                                  style: TextStyle(
                                                    fontSize: 14.5.sp,
                                                    fontFamily: 'Varela Round',
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                       ),
                      Container(
                            width: 43.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 88, 39, 125),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF3A224B),
                                  spreadRadius: 2,
                                  offset: Offset(-2, 0)
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 79,
                                        height: 79,
                                        margin: EdgeInsets.only(top: 15),
                                        child: Image.asset(
                                          "assets/img/elizabete.png"
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Elizabete Souza",
                                          style: TextStyle(
                                           fontSize: 14.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Fatec Ribeirão Preto",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Ranking Ouro",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(snackbar2);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 3, right: 3),
                                          width: 43.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 65, 10, 107),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF3A224B),
                                                spreadRadius: 2,
                                                offset: Offset(-2, 0)
                                              )
                                            ]
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.person_add,
                                                  color: Colors.white,
                                                  size: 30,
                                                  ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "adicionar",
                                                  style: TextStyle(
                                                    fontSize: 14.5.sp,
                                                    fontFamily: 'Varela Round',
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                       )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                            width: 43.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 88, 39, 125),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF3A224B),
                                  spreadRadius: 2,
                                  offset: Offset(-2, 0)
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 79,
                                        height: 79,
                                        margin: EdgeInsets.only(top: 15),
                                        child: Image.asset(
                                          "assets/img/jose.png"
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "João Ricardo",
                                          style: TextStyle(
                                           fontSize: 14.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "USP Ribeirão Preto",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Ranking Ouro",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(snackbar2);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 3, right: 3),
                                          width: 43.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 65, 10, 107),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF3A224B),
                                                spreadRadius: 2,
                                                offset: Offset(-2, 0)
                                              )
                                            ]
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.person_add,
                                                  color: Colors.white,
                                                  size: 30,
                                                  ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "adicionar",
                                                  style: TextStyle(
                                                    fontSize: 14.5.sp,
                                                    fontFamily: 'Varela Round',
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                       ),
                      Container(
                            width: 43.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 88, 39, 125),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF3A224B),
                                  spreadRadius: 2,
                                  offset: Offset(-2, 0)
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 79,
                                        height: 79,
                                        margin: EdgeInsets.only(top: 15),
                                        child: Image.asset(
                                          "assets/img/claudia.png"
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Claudia Machado",
                                          style: TextStyle(
                                           fontSize: 14.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Fatec Ribeirão Preto",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Ranking Ouro",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(snackbar2);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 3, right: 3),
                                          width: 43.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 65, 10, 107),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF3A224B),
                                                spreadRadius: 2,
                                                offset: Offset(-2, 0)
                                              )
                                            ]
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.person_add,
                                                  color: Colors.white,
                                                  size: 30,
                                                  ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "adicionar",
                                                  style: TextStyle(
                                                    fontSize: 14.5.sp,
                                                    fontFamily: 'Varela Round',
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                       )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                            width: 43.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 88, 39, 125),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF3A224B),
                                  spreadRadius: 2,
                                  offset: Offset(-2, 0)
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 79,
                                        height: 79,
                                        margin: EdgeInsets.only(top: 15),
                                        child: Image.asset(
                                          "assets/img/roberta.png"
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Roberta Pereira",
                                          style: TextStyle(
                                           fontSize: 14.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Unaerp Ribeirão Preto",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Ranking Bronze",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(snackbar2);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 3, right: 3),
                                          width: 43.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 65, 10, 107),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF3A224B),
                                                spreadRadius: 2,
                                                offset: Offset(-2, 0)
                                              )
                                            ]
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.person_add,
                                                  color: Colors.white,
                                                  size: 30,
                                                  ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "adicionar",
                                                  style: TextStyle(
                                                    fontSize: 14.5.sp,
                                                    fontFamily: 'Varela Round',
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                       ),
                      Container(
                            width: 43.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 88, 39, 125),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF3A224B),
                                  spreadRadius: 2,
                                  offset: Offset(-2, 0)
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 79,
                                        height: 79,
                                        margin: EdgeInsets.only(top: 15),
                                        child: Image.asset(
                                          "assets/img/marcelo.png"
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Marcelo Ribeiro",
                                          style: TextStyle(
                                           fontSize: 14.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Fatec Ribeirão Preto",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Ranking Prata",
                                          style: TextStyle(
                                           fontSize: 11.sp,
                                           fontFamily: 'Varela Round',
                                           color: Colors.white60
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(snackbar2);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 3, right: 3),
                                          width: 43.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 65, 10, 107),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF3A224B),
                                                spreadRadius: 2,
                                                offset: Offset(-2, 0)
                                              )
                                            ]
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.person_add,
                                                  color: Colors.white,
                                                  size: 30,
                                                  ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "adicionar",
                                                  style: TextStyle(
                                                    fontSize: 14.5.sp,
                                                    fontFamily: 'Varela Round',
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                       )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}