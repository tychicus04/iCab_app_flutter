import 'package:flutter/material.dart';
import 'package:flutter_booking_car/core/helper/asset_helper.dart';
import 'package:flutter_booking_car/core/helper/image_helper.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: ImageHelper.loadFromAsset(
            AssetHelper.ic_user_menu
          ),
          title: const Text(
            'My Profile',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            )
          ),
        ),
        ListTile(
          leading: ImageHelper.loadFromAsset(
            AssetHelper.ic_refresh_menu
          ),
          title: const Text(
            'Ride History',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            )
          ),
        ),
        ListTile(
          leading: ImageHelper.loadFromAsset(
            AssetHelper.ic_percent_menu
          ),
          title: const Text(
            'Offers',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            )
          ),
        ),
        ListTile(
          leading: ImageHelper.loadFromAsset(
            AssetHelper.ic_bell_menu
          ),
          title: const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            )
          ),
        ),
        ListTile(
          leading: ImageHelper.loadFromAsset(
            AssetHelper.ic_help_circle_menu
          ),
          title: const Text(
            'Help & Support',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            )
          ),
        ),
        ListTile(
          leading: ImageHelper.loadFromAsset(
            AssetHelper.ic_log_out_menu
          ),
          title: const Text(
            'Log out',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff323643),
            )
          ),
        ),

        // const Text(
        //     'Settings',
        //     style: TextStyle(
        //       fontSize: 18,
        //       color: Color(0xff323643),
        //     )
        //   ),
      ]
    );
  }
}