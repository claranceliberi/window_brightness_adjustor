

import 'dart:io';

import 'package:screen/screen.dart';

class Brightness{
  double _brightnessLevel = 0;
  bool _isKeptOn = false;
  double _brightness = 0;

  initPlatformState() async {
    _isKeptOn = await Screen.isKeptOn;
    _brightness = await Screen.brightness;
  }

  setBrightness(double level){
    _brightness = level;
    Screen.setBrightness(level);
    print(level);
  }

  double getBrightness(){
    return _brightness;
  }

  bool getIsKeptOn(){
    return _isKeptOn;
  }

  //function to change brightness
  void changeBrightness(double level){
      setBrightnessLevel(level);

    // Future.delayed(const Duration(milliseconds:500), (){
    Stopwatch st = new Stopwatch()..start();
    Process.run('powershell', ['(Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,$_brightnessLevel)']).then((ProcessResult pr){
      print(pr.exitCode);
      print(pr.stdout);
      print(pr.stderr);
      print(st.elapsed);
    });
    // });
  }


  double getBrightnessLevel(){
    return _brightnessLevel;
  }

  void setBrightnessLevel(double level){
    _brightnessLevel = level;
  }
}