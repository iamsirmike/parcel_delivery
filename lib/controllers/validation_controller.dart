class ValidationController {
  static validatePickUpLocation(String pickuplocation) {
    if (pickuplocation.isEmpty) {
      return "Please enter a pickup location";
    } else {
      return null;
    }
  }

  static validatedropoffLocation(String dropofflocation) {
    if (dropofflocation.isEmpty) {
      return "Please enter a dropoff location";
    } else {
      return null;
    }
  }

  static validatereceipientname(String receipientname) {
    if (receipientname.isEmpty) {
      return 'Please enter the receipient name';
    } else {
      return null;
    }
  }
  static validatereceipientphone(String receipientphone) {
    if (receipientphone.isEmpty) {
      return 'Please enter the receipient name';
    } else {
      return null;
    }
  }
  static validateitemname(String itemname) {
    if (itemname.isEmpty) {
      return 'Please enter the receipient name';
    } else {
      return null;
    }
  }
  static validatedescription(String description) {
    if (description.isEmpty) {
      return 'Please enter the receipient name';
    } else {
      return null;
    }
  }
}
