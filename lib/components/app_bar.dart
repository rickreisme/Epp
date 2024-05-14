// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_string_interpolations

import 'package:epp/model/mensagem.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../controller/login_controller.dart';
import '../pages/auth/login.dart';
import '../pages/basic/configs.dart';
import '../pages/basic/notifications.dart';

class CustomAppBar extends StatelessWidget {
  final Future<String> userNameFuture;
  final String pageTitle;

  CustomAppBar({required this.userNameFuture, required this.pageTitle});

  String getInitials(String name) {
    List<String> nameSplit = name.split(" ");
    if (nameSplit.length > 1) {
      return "${nameSplit[0][0]}${nameSplit.last[0]}";
    } else {
      if (name.length >= 2) {
        int lastInitialIndex = name.indexOf(' ') + 1;
        return "${name[0]}${name[lastInitialIndex]}";
      } else {
        return name;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FutureBuilder<String>(
          future: userNameFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 19.sp,
                          fontFamily: 'Varela Round',
                          color: Color(0xFF8E59B6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Login()),
                          (route) => false,
                        );
                        mensagemSucesso(
                            context, "Usuário desconectado com sucesso");
                        LoginController().logout(context);
                      },
                      icon: Icon(Icons.exit_to_app, size: 20),
                      label: Text(
                        getInitials(snapshot.data.toString()),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              pageTitle,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Varela Round',
                fontSize: 19.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        IconButton(
          padding: EdgeInsets.only(top: 10),
          color: Color(0xFF8E59B6),
          icon: SizedBox(
            height: 55,
            width: 55,
            child: Icon(
              Icons.notifications,
              size: 33,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationPage(),
              ),
            );
          },
        ),
        IconButton(
          padding: EdgeInsets.only(top: 10),
          color: Color(0xFF8E59B6),
          icon: SizedBox(
            height: 41,
            width: 41,
            child: Icon(
              Icons.settings,
              size: 33,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageConfigs(),
              ),
            );
          },
        ),
      ],
    );
  }
}
