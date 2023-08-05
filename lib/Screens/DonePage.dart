import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done Tasks'),
      ),
        body: ListView(
          children: [
            Card(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.white70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Text(
                        'Title',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Row(
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Time',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {},
                            color: Colors.red,
                          ),
                          IconButton(
                            icon: Icon(Icons.archive),
                            onPressed: () {},
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}