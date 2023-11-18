// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FontFamily {
  static const String minhaFonte = 'Varela Round';
}

class EstiloTexto {
  static TextStyle textoSimples = TextStyle(
    fontFamily: FontFamily.minhaFonte,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

}



