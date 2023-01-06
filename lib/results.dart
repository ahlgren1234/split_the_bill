import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double friends;
  final double tip;

  const ResultsPage(
      {super.key,
      required this.bill,
      required this.tax,
      required this.friends,
      required this.tip});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String dividedamount = "";

  @override
  void initState() {
    super.initState();
    divideamount();
  }

  divideamount() {
    double taxamount =
        double.parse(widget.bill) * (double.parse(widget.tax) / 100);
    double finalbill = double.parse(widget.bill) + taxamount + widget.tip;
    double finalbillperperson = finalbill / widget.friends;

    setState(() {
      dividedamount = finalbillperperson.toStringAsFixed(2);
    });
  }

  TextStyle infostyle = GoogleFonts.montserrat(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Split The Bill"),
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        margin: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                top: 40.0,
              ),
              child: Text(
                "Result",
                style: GoogleFonts.montserrat(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
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
                          "Equally Divided",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "\$$dividedamount",
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
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
                            Text(widget.friends.round().toString(),
                                style: infostyle),
                            Text("${widget.tax} %", style: infostyle),
                            Text("\$${widget.tip.round().toString()}",
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
              height: 20.0,
            ),
            Text(
              "Everyone should pay \$$dividedamount",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () => Navigator.pop(context),
                child: Center(
                  child: Text(
                    "Calculate Again?",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
