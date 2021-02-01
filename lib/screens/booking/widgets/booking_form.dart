import 'package:flutter/material.dart';
import 'package:parcel_delivery/controllers/booking_controller.dart';
import 'package:parcel_delivery/controllers/validation_controller.dart';
import 'package:parcel_delivery/screens/Widgets/custom_flat_button.dart';
import 'package:parcel_delivery/screens/Widgets/textbox_seperator.dart';
import 'package:parcel_delivery/screens/Widgets/txt_decoration.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({
    Key key,
    @required this.bookingController,
  }) : super(key: key);

  final BookingController bookingController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BookingController.bookFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) => bookingController.setRecepientName = value,
                validator: (value) =>
                    ValidationController.validatereceipientname(value),
                decoration: textInputDecoration(
                  label: 'Enter recipient name',
                ),
              ),
              TextboxSeperator(),
              TextFormField(
                onSaved: (value) => bookingController.setPhone = value,
                validator: (value) =>
                    ValidationController.validatereceipientphone(value),
                decoration: textInputDecoration(
                  label: 'Enter recipient Phone',
                ),
              ),
              TextboxSeperator(),
              TextFormField(
                onSaved: (value) => bookingController.setItemsName = value,
                validator: (value) =>
                    ValidationController.validateitemname(value),
                decoration: textInputDecoration(
                  label: 'Enter item(s) name(s)',
                ),
              ),
              TextboxSeperator(),
              TextFormField(
                onSaved: (value) => bookingController.setDescription = value,
                validator: (value) =>
                    ValidationController.validatedescription(value),
                maxLines: 2,
                decoration: textInputDecoration(
                  label: 'Description',
                ),
              ),
              TextboxSeperator(),
              CustomFlatButton(
                text: 'Done',
                width: 320,
                onpress: () {
                  bookingController.book();
                  print(bookingController.itemsname);
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
