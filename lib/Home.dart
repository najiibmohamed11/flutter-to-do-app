import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    stops: [
                      0.4,
                      0.7
                    ], // Positions where the colors start and end
                    colors: [
                      Color(0xffB161D0),
                      Color(0xff3793FF)
                    ], // Gradient colors
                    begin: Alignment.centerLeft, // Gradient start position
                    end: Alignment.centerRight, // Gradient end position
                  ).createShader(bounds);
                },
                child: Text(
                  "Todo App",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xff2E2E2E),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors
                              .blue, // Set the text color of the TextField
                        ),
                        decoration: InputDecoration(
                          hintText: "Task Name",
                          hintStyle: TextStyle(color: Colors.white38),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,

                            // Border radius of the filled area
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.alarm,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 80.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(12.0), // Make it rounded
                        color: isChecked
                            ? Colors.green
                            : Colors.transparent, // Fill color
                        border: Border.all(
                          color: Colors.green, // Stroke color
                          width: 2.0,
                        ),
                      ),
                      child: isChecked
                          ? Icon(
                              Icons.check,
                              size: 16.0,
                              color: Colors.black,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Text(
                      "reading book",
                      style:
                          TextStyle(color: Color(0xffC2C2C2), fontSize: 17.0),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "02:25 AM",
                    style: TextStyle(color: Color(0xffC2C2C2)),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
