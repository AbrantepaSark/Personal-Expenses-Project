import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String label;
  final double amount;
  final double pctOfTotal;

  BarChart(this.label, this.amount, this.pctOfTotal);
  @override
  Widget build(BuildContext context) {
    // print(pctOfTotal);
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Container(
              height: constraints.maxHeight * .15,
              child: Text('\$${amount.toStringAsFixed(0)}')),
          SizedBox(height: constraints.maxHeight * .05),
          Container(
              height: constraints.maxHeight * .6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(220, 220, 220, 1))),
                  FractionallySizedBox(
                    heightFactor: pctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(height: constraints.maxHeight * .05),
          Container(
              height: constraints.maxHeight * .15,
              child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}
