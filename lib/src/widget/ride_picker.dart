import 'package:flutter/material.dart';
import 'package:flutter_booking_car/core/constants/color_constants.dart';
import 'package:flutter_booking_car/core/helper/asset_helper.dart';
import 'package:flutter_booking_car/core/helper/image_helper.dart';
import 'package:flutter_booking_car/model/place_item_res.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RidePicker extends StatefulWidget {
  final Function(PlaceItemRes, bool) onSelected;
  const RidePicker(this.onSelected, {super.key});

  @override
  State<RidePicker> createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  PlaceItemRes? fromAddress;
  PlaceItemRes? toAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: ColorPallete.boxShadow,
            offset: Offset(0, 5),
            blurRadius: 5.0,
          )
        ]
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {

              }, 
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: ImageHelper.loadFromAsset(
                          AssetHelper.ic_map_pointer_menu
                        )
                      )
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.xmark,
                          color: Color.fromARGB(255, 151, 154, 164),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        // ignore: unnecessary_null_comparison
                        fromAddress == null ? 'From' : fromAddress!.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorPallete.iconColor
                        )
                      )
                    )
                  ]
                )
              ),
            )
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: ImageHelper.loadFromAsset(
                          AssetHelper.ic_map_pointer_menu
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      width: 30,
                      height: 30,
                      child: Icon(
                        FontAwesomeIcons.xmark,
                        color: Color.fromARGB(255, 151, 154, 164),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        // ignore: unnecessary_null_comparison
                        toAddress == null ? 'To' : toAddress!.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorPallete.iconColor
                        )
                      )
                    )
                  ]

                )
              )
            )
          )
        ]
      )
    );
  }
}