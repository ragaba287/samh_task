class FlightModel {
  Departure? departure;
  Departure? arrival;
  String? date;
  int? stops;
  int? price;

  FlightModel({
    this.departure,
    this.arrival,
    this.date,
    this.stops,
    this.price,
  });

  FlightModel.fromJson(Map<String, dynamic> json) {
    departure = Departure.fromJson(json['departure']);
    arrival = Departure.fromJson(json['arrival']);
    date = json['date'];
    stops = json['stops'];
    price = json['price'];
  }
}

class Departure {
  String? airportCode;
  String? airportName;
  String? terminal;
  String? time;

  Departure({
    this.airportCode,
    this.airportName,
    this.terminal,
    this.time,
  });

  Departure.fromJson(Map<String, dynamic> json) {
    airportCode = json['airportCode'];
    airportName = json['airportName'];
    terminal = json['terminal'];
    time = json['time'];
  }
}
