import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_the_bill/results.dart';
import 'package:split_the_bill/settings.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({super.key});

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  double friendsvalue = 1.0;
  double tip = 0.0;
  String tax = "0";
  String bill = "";

  final List<double> slidervalues = [
    1.0,
    2.0,
    3.0,
    4.0,
    5.0,
    6.0,
    7.0,
    8.0,
    9.0,
    10.0,
    11.0,
    12.0,
    13.0,
    14.0,
    15.0
  ];

  bool _isValuesEntered = false;

  TextStyle infostyle = GoogleFonts.montserrat(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700);

  buildbutton(String text) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(20.0),
        ),
        onPressed: () {
          if (text == "-") {
            setState(() {
              bill = "";
            });
          } else {
            setState(() {
              bill += text;
            });
          }

          if (bill != "") {
            setState(() {
              _isValuesEntered = true;
            });
          } else {
            setState(() {
              _isValuesEntered = false;
            });
          }
        },
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Split The Bill"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Open Settings',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            bill == "" ? "0" : bill,
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Persons", style: infostyle),
                              Text("Tax", style: infostyle),
                              Text("Tip ", style: infostyle),
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(friendsvalue.round().toString(),
                                  style: infostyle),
                              Text("$tax %", style: infostyle),
                              Text("\$${tip.round().toString()}",
                                  style: infostyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "How many persons?",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Slider(
                min: 1,
                max: slidervalues.length - 1,
                divisions: slidervalues.length - 1,
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                value: friendsvalue,
                label: slidervalues[friendsvalue.toInt() - 1].toString(),
                onChanged: (value) {
                  setState(() {
                    friendsvalue = slidervalues[value.toInt() - 1];
                  });
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "TIP",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (tip > 0) {
                                      tip--;
                                    }
                                  });
                                },
                                backgroundColor: Colors.grey[400],
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "\$${tip.round().toString()}",
                              style: GoogleFonts.montserrat(
                                fontSize: 27,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    tip++;
                                  });
                                },
                                backgroundColor: Colors.grey[400],
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            tax = value;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                          ),
                          labelText: "Tax in %",
                          labelStyle: GoogleFonts.montserrat(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  buildbutton("1"),
                  buildbutton("2"),
                  buildbutton("3"),
                ],
              ),
              Row(
                children: [
                  buildbutton("4"),
                  buildbutton("5"),
                  buildbutton("6"),
                ],
              ),
              Row(
                children: [
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                ],
              ),
              Row(
                children: [
                  buildbutton("."),
                  buildbutton("0"),
                  buildbutton("-"),
                ],
              ),
              Container(
                child: _isValuesEntered
                    ? TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                        ),
                        onPressed: _isValuesEntered
                            ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultsPage(
                                        bill: bill,
                                        tax: tax,
                                        friends: friendsvalue,
                                        tip: tip)))
                            : null,
                        child: Center(
                          child: Text(
                            "Split Bill",
                            style: GoogleFonts.montserrat(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
