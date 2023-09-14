// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_booking_car/blocs/place_bloc.dart';
import 'package:flutter_booking_car/core/helper/asset_helper.dart';
import 'package:flutter_booking_car/core/helper/image_helper.dart';
import 'package:flutter_booking_car/model/place_item_res.dart';

class RidePickerPage extends StatefulWidget {
  final String selectedAddress;
  final Function(PlaceItemRes, bool) onSelected;
  // ignore: unused_field
  final bool _isFromAddress;
  const RidePickerPage(this._isFromAddress, this.selectedAddress, this.onSelected, {super.key});

  @override
  State<RidePickerPage> createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  // ignore: prefer_typing_uninitialized_variables
  var _addressController;
  var placeBloc = PlaceBloc();

  @override
  void initState() {
    _addressController = TextEditingController(
      text: widget.selectedAddress
    );
    super.initState();
  }

  // @override
  // void dispose() {
  //   placeBloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xfff8f8f8),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 60,
                        child: Center(
                          child: ImageHelper.loadFromAsset(
                            AssetHelper.ic_map_pointer_menu
                          )
                        )
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 60,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              _addressController.text = '';
                            },
                            child: ImageHelper.loadFromAsset(
                              AssetHelper.ic_remove
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 50
                        ),
                        child: TextField(
                          controller: _addressController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str) {
                            placeBloc.searchPlace(str);
                          },
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff323643),
                            )
                        )
                      )
                    ]
                  ),
                )
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: StreamBuilder(
                stream: placeBloc.PlaceStream,
                builder: (context, snapshot) {
                  if(snapshot.data) {
                    print(snapshot.data.toString());
                    if(snapshot.data == 'start') {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    print(snapshot.data.toString());
                    List<PlaceItemRes> places = snapshot.data;
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            places.elementAt(index).name
                          ),
                          subtitle: Text(
                            places.elementAt(index).address
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            // Widget.onSelected(places.elementAt(index),
                            //   widget._isFromAddress
                            // );
                          }
                        );
                      }, 
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: Color(0xfff5f5f5),
                      ), 
                      itemCount: places.length, 
                    );
                  } else {
                    return Container();
                  }
                }
              )
            )
          ]
        )
      )
    );
  }
}