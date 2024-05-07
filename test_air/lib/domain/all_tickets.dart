class AllTickets {
  List<Tickets>? tickets;

  AllTickets({this.tickets});

  AllTickets.fromJson(Map<String, dynamic> json) {
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(new Tickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tickets != null) {
      data['tickets'] = this.tickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tickets {
  int? id;
  String? badge;
  Price? price;
  String? providerName;
  String? company;
  Departure? departure;
  Departure? arrival;
  bool? hasTransfer;
  bool? hasVisaTransfer;
  Luggage? luggage;
  HandLuggage? handLuggage;
  bool? isReturnable;
  bool? isExchangable;

  Tickets(
      {this.id,
      this.badge,
      this.price,
      this.providerName,
      this.company,
      this.departure,
      this.arrival,
      this.hasTransfer,
      this.hasVisaTransfer,
      this.luggage,
      this.handLuggage,
      this.isReturnable,
      this.isExchangable});

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    badge = json['badge'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    providerName = json['provider_name'];
    company = json['company'];
    departure = json['departure'] != null
        ? new Departure.fromJson(json['departure'])
        : null;
    arrival = json['arrival'] != null
        ? new Departure.fromJson(json['arrival'])
        : null;
    hasTransfer = json['has_transfer'];
    hasVisaTransfer = json['has_visa_transfer'];
    luggage =
        json['luggage'] != null ? new Luggage.fromJson(json['luggage']) : null;
    handLuggage = json['hand_luggage'] != null
        ? new HandLuggage.fromJson(json['hand_luggage'])
        : null;
    isReturnable = json['is_returnable'];
    isExchangable = json['is_exchangable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['badge'] = this.badge;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['provider_name'] = this.providerName;
    data['company'] = this.company;
    if (this.departure != null) {
      data['departure'] = this.departure!.toJson();
    }
    if (this.arrival != null) {
      data['arrival'] = this.arrival!.toJson();
    }
    data['has_transfer'] = this.hasTransfer;
    data['has_visa_transfer'] = this.hasVisaTransfer;
    if (this.luggage != null) {
      data['luggage'] = this.luggage!.toJson();
    }
    if (this.handLuggage != null) {
      data['hand_luggage'] = this.handLuggage!.toJson();
    }
    data['is_returnable'] = this.isReturnable;
    data['is_exchangable'] = this.isExchangable;
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

class Departure {
  String? town;
  String? date;
  String? airport;

  Departure(Departure? arrival, {this.town, this.date, this.airport});

  Departure.fromJson(Map<String, dynamic> json) {
    town = json['town'];
    date = json['date'];
    airport = json['airport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['town'] = this.town;
    data['date'] = this.date;
    data['airport'] = this.airport;
    return data;
  }
}

class Luggage {
  bool? hasLuggage;
  Price? price;

  Luggage({this.hasLuggage, this.price});

  Luggage.fromJson(Map<String, dynamic> json) {
    hasLuggage = json['has_luggage'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_luggage'] = this.hasLuggage;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}

class HandLuggage {
  bool? hasHandLuggage;
  String? size;

  HandLuggage({this.hasHandLuggage, this.size});

  HandLuggage.fromJson(Map<String, dynamic> json) {
    hasHandLuggage = json['has_hand_luggage'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_hand_luggage'] = this.hasHandLuggage;
    data['size'] = this.size;
    return data;
  }
}