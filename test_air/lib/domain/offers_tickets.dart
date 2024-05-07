class OffersTickets {
  List<TicketsOffers>? ticketsOffers;

  OffersTickets({this.ticketsOffers});

  OffersTickets.fromJson(Map<String, dynamic> json) {
    if (json['tickets_offers'] != null) {
      ticketsOffers = <TicketsOffers>[];
      json['tickets_offers'].forEach((v) {
        ticketsOffers!.add(new TicketsOffers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ticketsOffers != null) {
      data['tickets_offers'] =
          this.ticketsOffers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketsOffers {
  int? id;
  String? title;
  List<String>? timeRange;
  Price? price;

  TicketsOffers({this.id, this.title, this.timeRange, this.price});

  TicketsOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    timeRange = json['time_range'].cast<String>();
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['time_range'] = this.timeRange;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}

class Price {
  int? value;

  Price({this.value});

  Price.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}