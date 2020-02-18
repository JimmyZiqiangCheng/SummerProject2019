class Event {
  int id;
  String title; // where the Event is currently stored (Event locker? front desk?)
  String description; // who collected the Event?
  DateTime eventTime; // when is the Event collected by front desk?
  bool isFavored; // is the Event picked up by resident?

  Event({this.id, this.title, this.description, this.eventTime, this.isFavored = false});

  Event.initial()
      : id = 0,
        title = '',
        description = '',
        eventTime = null,
        isFavored = false;

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    eventTime = DateTime.tryParse(json['eventTime']);
    isFavored = json['isFavored'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['eventTime'] = eventTime.toString();
    data['isFavored'] = isFavored;
    return data;
  }
}