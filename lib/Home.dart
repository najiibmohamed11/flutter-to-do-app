import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  List data = [];
  List time = [];
  List isCheckedList = []; // List to track checked state
  TimeOfDay newtime = TimeOfDay.now();
  void _showtimepicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        time.add(value);
        print(time);
      });
    });
  }

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
                    stops: [0.4, 0.7],
                    colors: [Color(0xffB161D0), Color(0xff3793FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds);
                },
                child: Text(
                  "Todo App",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
                        controller: _controller,
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                          hintText: "Task Name",
                          hintStyle: TextStyle(color: Colors.white38),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        return _showtimepicker();
                      },
                      child: Container(
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
                    ),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          time.add(TimeOfDay.now());

                          String newTask = _controller.text;
                          data.add(newTask);
                          isCheckedList.add(false); // Initialize as unchecked
                          _controller.clear(); // Clear the TextField
                        });
                      },
                      child: Container(
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isCheckedList[index] = !isCheckedList[index];
                                });
                              },
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: isCheckedList[index]
                                      ? Colors.green
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 2.0,
                                  ),
                                ),
                                child: isCheckedList[index]
                                    ? Icon(
                                        Icons.check,
                                        size: 16.0,
                                        color: Colors.black,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Expanded(
                              child: Text(
                                data[index],
                                style: TextStyle(
                                  color: Color(0xffC2C2C2),
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              time[index].format(context),
                              style: TextStyle(color: Color(0xffC2C2C2)),
                            ),
                            SizedBox(width: 10.0),
                            IconButton(
                              icon: Icon(Icons.delete,color: Colors.red,),
                              onPressed: () {
                                setState(() {
                                  if (index < data.length) {
                                    data.removeAt(index);
                                    time.removeAt(index);
                                    isCheckedList.removeAt(index);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
