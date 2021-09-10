import 'package:carApp/utils/utils.dart';
import 'package:flutter/material.dart';
import '../widgets/specific_card.dart';

class CarDetail extends StatelessWidget {
  final String title;
  final double price;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String path;

  CarDetail(
      {this.title,
      this.price,
      this.color,
      this.gearbox,
      this.fuel,
      this.brand,
      this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.share, size: 30)),
          ],
        ),
        body: Row(children: [
          Column(children: [
            Text(
              title,
              style: MainHeading,
            ),
            Text(
              brand,
              style: BasicHeading,
            ),
            SizedBox(
              child: Hero(
                tag: title,
                child: Image.asset(path),
              ),
              height: 100,
              width: 200,
            )
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SpecificsCard(
                    name: '12 Month',
                    price: price * 12,
                    name2: 'Dollars',
                  ),
                  SpecificsCard(
                    name: '6 Month',
                    price: price * 6,
                    name2: 'Dollars',
                  ),
                  SpecificsCard(
                    name: '1 Month',
                    price: price * 1,
                    name2: 'Dollars',
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                'SPECIFICATIONS',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SpecificsCard(
                    name: 'Color',
                    name2: color,
                  ),
                  SpecificsCard(
                    name: 'Gearbox',
                    name2: gearbox,
                  ),
                  SpecificsCard(
                    name: 'Fuel',
                    name2: fuel,
                  )
                ],
              ),
              SizedBox(height: 10),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Theme.of(context).accentColor,
                onPressed: null,
                child: Text(
                  'Book Now',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ]),
          )
        ]));
  }
}
