import 'package:carApp/utils/utils.dart';
import 'package:flutter/material.dart';
import '../models/cars.dart';
import '../screens/car_detail.dart';

class CarsGrid extends StatelessWidget {
  final DateTime start;
  final DateTime end;

  CarsGrid({this.start, this.end});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: availCarsList.cars.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CarDetail(
                      title: allCars.cars[i].title,
                      brand: allCars.cars[i].transmission,
                      fuel: allCars.cars[i].fuel,
                      price: allCars.cars[i].price,
                      path: allCars.cars[i].path,
                      gearbox: allCars.cars[i].doors,
                      color: allCars.cars[i].color,
                    )));
          },
          child: Container(
              margin: EdgeInsets.only(
                  top: i.isEven ? 0 : 20, bottom: i.isEven ? 20 : 0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 1)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                      tag: availCarsList.cars[i].title,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            availCarsList.cars[i].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Image.asset(
                          allCars.cars[i].path,
                          width: 400,
                          height: 200,
                        )
                      ])),
                  Column(children: [
                    Text((availCarsList.cars[i].price).toString(),
                        style: SubHeading),
                    Text('per day')
                  ])
                ],
              )),
        ),
      ),
    );
  }
}
