class Parcel {
  int id;
  String trackingNumber;
  String location; // where the parcel is currently stored (parcel locker? front desk?)
  String collector; // who collected the parcel?
  DateTime deliverTime; // when is the parcel collected by front desk?
  DateTime pickupTime; // when is the parcel picked up by resident?
  bool isPickedUp; // is the parcel picked up by resident?

  Parcel({this.id, this.trackingNumber, this.location, this.collector, this.deliverTime, this.pickupTime, this.isPickedUp = false});

  Parcel.initial()
      : id = 0,
        trackingNumber = '',
        location = '',
        collector = '',
        deliverTime = null,
        pickupTime = null,
        isPickedUp = false;

  Parcel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trackingNumber = json['trackingNumber'];
    location = json['location'];
    collector = json['collector'];
    deliverTime = DateTime.parse(json['deliverTime']);
    String pickupTimeStr = json['pickupTime'];
    pickupTime = pickupTimeStr.length > 0 ? DateTime.parse(pickupTimeStr) : null;
    isPickedUp = json['isPickedUp'] == 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['trackingNumber'] = trackingNumber;
    data['location'] = location;
    data['collector'] = collector;
    data['deliverTime'] = deliverTime.millisecondsSinceEpoch;
    data['pickUpTime'] = pickupTime.millisecondsSinceEpoch;
    data['isPickedUp'] = isPickedUp;
    return data;
  }

}