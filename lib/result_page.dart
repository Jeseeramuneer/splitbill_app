import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
   final double friendsValue;
  final double tip;
 final String tax;
 final String bill;

  const ResultPage({required this.friendsValue, required this.tip, required this.tax, required this.bill});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String devidedamount='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    divideamount();
  }
  divideamount(){
    double tax_amount = double.parse(widget.bill) * (double.parse(widget.tax) / 100);
    double finalbill = (double.parse(widget.bill) + tax_amount + widget.tip) / widget.friendsValue;
    setState(() {
      devidedamount = finalbill.toStringAsFixed(2);
    });
  }

  TextStyle infostyle = GoogleFonts.montserrat(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Result',style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 100,
              decoration: BoxDecoration(
                  color: Color(0xff1d1e33)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Equally Divided', style: infostyle,
                        ),
                        Text("\$$devidedamount", style: GoogleFonts.montserrat(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Friends", style: infostyle,),
                            Text("Tax", style: infostyle),
                            Text("Tip", style: infostyle),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.friendsValue.round().toString(), style: infostyle),
                            Text('${widget.tax} %', style: infostyle),
                            Text("\$${widget.tip.round().toString()}", style: infostyle)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Text("Every body should pay $devidedamount",style: GoogleFonts.montserrat(
                  fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700,),),
                SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: TextButton(style: TextButton.styleFrom(
                backgroundColor: Colors.green
              ),

                  onPressed: (){
                Navigator.pop(context);
                  },
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Recalculate',style: GoogleFonts.montserrat(
                          fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,)),
                      )),
              )
            ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
