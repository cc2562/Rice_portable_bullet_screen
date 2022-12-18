

import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_button/sleek_button.dart';

final String version = "1.0.2";


void fristrun() async{
  SharedPreferences? sharedPreferences=await SharedPreferences.getInstance();
  if(sharedPreferences.getInt('timerun')!=2){
    sharedPreferences.setInt('timerun', 1);
  }else{
  }
  }

  Future<bool> nexttime() async{
    SharedPreferences? sharedPreferences=await SharedPreferences.getInstance();
  if(sharedPreferences.getInt('timerun')!=2){
      sharedPreferences.setInt('timerun', 1);
    }else{
    }
    if(sharedPreferences.getInt('timerun')==1){
      return false;
    }else{
      return true;
    }
  }

  void getit() async{
    SharedPreferences? sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setInt('timerun', 2);
  }

  void setipadmod(bool get) async{
    SharedPreferences? ipadcun=await SharedPreferences.getInstance();
    ipadcun.setBool('ipadmod', get);
  }

Future<bool?> isipadmod() async{
  SharedPreferences? ipadcun = await SharedPreferences.getInstance();
  var ipadmods = ipadcun.getBool('ipadmod');
  return ipadmods;
}

void newversion() async{
  SharedPreferences? newversion = await SharedPreferences.getInstance();
  newversion.setString("version", version);
}

Future<bool> isversion() async{
  SharedPreferences? stab = await SharedPreferences.getInstance();
  if(stab.getString('version')!=version){
    newversion();
    return false;
  }else{
    return true;
  }
}