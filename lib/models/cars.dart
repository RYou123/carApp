import 'package:flutter/foundation.dart';

class CarItem {
  final String title;
  final double price;
  final String path;
  final String color;
  final String doors;
  final String fuel;
  final String transmission;
  final bool isAvailable;
  final DateTime startDate1;
  final DateTime endDate1;

  CarItem(
      {@required this.title,
      @required this.price,
      @required this.path,
      @required this.color,
      @required this.doors,
      @required this.fuel,
      @required this.transmission,
      this.isAvailable,
      this.startDate1,
      this.endDate1});
}

CarsList allCars = CarsList(cars: [
  CarItem(
      title: 'Skoda Fabia',
      price: 30,
      color: 'Grey',
      doors: '5',
      fuel: 'Diesel',
      transmission: 'Manual',
      path: 'assets/car1.jpg',
      isAvailable: true),
  CarItem(
      title: 'Toyota Prius',
      price: 223,
      color: 'Gold',
      doors: '5',
      fuel: 'Unleaded Hybrid',
      transmission: 'Automatic',
      path: 'assets/car2.jpg'),
  CarItem(
      title: 'Toyota Prius',
      price: 223,
      color: 'Gold',
      doors: '5',
      fuel: 'Unleaded Hybrid',
      transmission: 'Automatic',
      path: 'assets/car2.jpg',
      isAvailable: true),
  CarItem(
      title: 'Toyota Prius',
      price: 223,
      color: 'Gold',
      doors: '5',
      fuel: 'Unleaded Hybrid',
      transmission: 'Automatic',
      path: 'assets/car2.jpg'),
]);

class CarsList {
  List<CarItem> cars;

  CarsList({this.cars});
}

CarsList availCarsList =
    CarsList(cars: allCars.cars.where((i) => i.isAvailable == true).toList());
