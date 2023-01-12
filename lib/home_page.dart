import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbill_app/result_page.dart';
class BillSplit extends StatefulWidget {
  const BillSplit({Key? key}) : super(key: key);

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
   double friendsValue=0.0;
  double tip=0.0;
  String tax='0';
  String bill='';

  buildbutton(String text) {
    return Expanded(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(20),
          ),
          onPressed: () {
            if(text=='-'){
              setState(() {
                bill='';
              });
            }else{
              setState(() {
                bill+=text;
              });
            }
          },
          child: Text(
            text, style: GoogleFonts.montserrat(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
          ),

        )
    );
  }


  TextStyle infostyle = GoogleFonts.montserrat(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.centerLeft,
                child: Text('Split Bill', style: GoogleFonts.montserrat(
                    fontSize: 25, fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
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
                          Text('Total', style: infostyle,
                          ),
                          Text(bill, style: GoogleFonts.montserrat(
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
                              Text(friendsValue.round().toString(), style: infostyle),
                              Text('$tax %', style: infostyle),
                              Text("\$${tip.round().toString()}", style: infostyle)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(height: 15),
              Text("How many friends", style: GoogleFonts.montserrat(
                  fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Slider(
                min: 0,
                max: 15,
                divisions: 15,
                activeColor: Color(0xff1d1e33),
                inactiveColor: Colors.blueGrey,
                value: friendsValue,
                onChanged: (value) {
                  setState(() {
                    friendsValue = value;
                  });
                },),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff1d1e33),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("Tip", style: GoogleFonts.montserrat(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(onPressed: () {
                                setState(() {
                                  tip--;
                                });
                              },
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.remove, color: Color(0xff1d1e33),),
                              ),
                            ),
                            Text('\$${tip.round().toString()}', style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                            Container(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(onPressed: () {
                                setState(() {
                                  tip++;
                                });
                              },
                                backgroundColor: Colors.grey[400],
                                child: Icon(Icons.add, color: Color(0xff1d1e33),),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(width: 20,),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 3,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          setState(() {
                            tax=value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),

                          ),
                          labelText: "Tax in %",
                          labelStyle: GoogleFonts.montserrat(
                              fontSize: 15, color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  buildbutton('1'),
                  buildbutton('2'),
                  buildbutton('3')
                ],
              ),
              Row(
                children: [
                  buildbutton('4'),
                  buildbutton('5'),
                  buildbutton('6')
                ],
              ),
              Row(
                children: [
                  buildbutton('7'),
                  buildbutton('8'),
                  buildbutton('9')
                ],
              ),
              Row(
                children: [
                  buildbutton('.'),
                  buildbutton('0'),
                  buildbutton('-'),
                ],
              ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextButton(style:
               TextButton.styleFrom(backgroundColor: Color(0xff1d1e33),
               ),
               onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                     friendsValue: friendsValue, tip: tip,tax: tax,bill: bill,

                   )));
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(
                     child: Text('Split ',style: GoogleFonts.montserrat(
                       fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),
                 ),
                   ),
           ),
           )),
            ],
          ),
        ),
      ),
    );
  }
}