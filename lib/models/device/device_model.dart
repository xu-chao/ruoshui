import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:xuchao/models/device/appliance.dart';

class DeviceModel extends Model {
  List<Appliance> _applianceList = [
    Appliance(
        title: '3600 ml',
        subtitle: '上次喝了',
        leftIcon: Icons.invert_colors,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),
    Appliance(
        title: '38 ℃',
        subtitle: '当前温度',
        leftIcon: Icons.queue_music,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: false),
    Appliance(
        title: '6 次',
        subtitle: '今日提醒',
        leftIcon: Icons.router,
        topRightIcon: Icons.router,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),
    Appliance(
        title: 'Good',
        subtitle: '智享饮水',
        leftIcon: Icons.lightbulb_outline,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),
    // Appliance(
    //     title: null,
    //     subtitle: '70 % brightness',
    //     leftIcon: Icons.threesixty,
    //     topRightIcon: Icons.threesixty,
    //     bottomRightIcon: Icons.threesixty,
    //     isEnable: true),
  ];
}

class ApplianceModel extends DeviceModel {
  List<Appliance> get allYatch {
    return List.from(_applianceList);
  }
}
