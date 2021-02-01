import 'package:flutter/material.dart';
import 'package:parcel_delivery/controllers/set_location_controller.dart';
import 'package:parcel_delivery/controllers/validation_controller.dart';
import 'package:parcel_delivery/screens/Widgets/custom_flat_button.dart';
import 'package:parcel_delivery/screens/Widgets/textbox_seperator.dart';
import 'package:parcel_delivery/screens/Widgets/txt_decoration.dart';

class PickLocationCard extends StatelessWidget {
  PickLocationCard({
    Key key,
    @required this.startAddressController,
    @required this.dropoffAddressController,
    this.data,
    this.onpress,
  }) : super(key: key);
  final SetLocationController setLocationController = SetLocationController();
  final TextEditingController startAddressController;
  final TextEditingController dropoffAddressController;
  final data;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35),
      child: SingleChildScrollView(
        child: Form(
          key: SetLocationController.setLocationFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: startAddressController,
                onChanged: (value) {
                  // setLocationController.setpickupLocation = data.startAddress;
                  data.startAddress = value;
                },
                validator: (value) =>
                    ValidationController.validatePickUpLocation(value),
                decoration: textInputDecoration(
                  label: 'Pickup location',
                  hint: 'Enter pickup point',
                  picon: Icon(Icons.looks_one),
                  sicon: IconButton(   
                    icon: Icon(Icons.my_location),
                    onPressed: onpress,
                  ),
                ),
              ),
              TextboxSeperator(),
              TextFormField(
                controller: dropoffAddressController,
                onChanged: (value) {
                  // setLocationController.setdropoffLocation = data.dropoffAddress;
                  data.dropoffAddress = value;
                },
                validator: (value) =>
                    ValidationController.validatedropoffLocation(value),
                decoration: textInputDecoration(
                  label: 'Dropoff location',
                  hint: 'Enter dropoff point',
                  picon: Icon(Icons.looks_two),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomFlatButton(
                width: 320,
                text: 'Continue',
                onpress: () {
                  setLocationController.setLocations(
                      context,
                      startAddressController.text,
                      dropoffAddressController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
