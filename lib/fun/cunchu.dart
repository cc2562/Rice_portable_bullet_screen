

import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_button/sleek_button.dart';




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



