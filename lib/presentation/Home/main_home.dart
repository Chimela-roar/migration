import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  TextEditingController name = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildHeader(),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            "Appointments",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        Card(
          elevation: 4.0,
          color: Colors.white,
          margin: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Container(
                    alignment: Alignment.bottomCenter,
                    width: 45.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: 8.0,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          height: 25,
                          width: 8.0,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          height: 40,
                          width: 8.0,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          height: 30,
                          width: 8.0,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                  title: Text("Today"),
                  subtitle: Text("18 patients"),
                ),
              ),
              VerticalDivider(),
              Expanded(
                child: ListTile(
                  leading: Container(
                    alignment: Alignment.bottomCenter,
                    width: 45.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: 8.0,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          height: 25,
                          width: 8.0,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          height: 40,
                          width: 8.0,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          height: 30,
                          width: 8.0,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                  title: Text("Canceled"),
                  subtitle: Text("7 patients"),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: _buildTile(
                  color: Colors.pink,
                  icon: Icons.portrait,
                  title: "Number of Patient",
                  data: "1200",
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: _buildTile(
                  color: Colors.green,
                  icon: Icons.portrait,
                  title: "Admitted",
                  data: "857",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _buildTile(
                  color: Colors.blue,
                  icon: Icons.favorite,
                  title: "Discharged",
                  data: "864",
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: _buildTile(
                  color: Colors.pink,
                  icon: Icons.portrait,
                  title: "Dropped",
                  data: "857",
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: _buildTile(
                  color: Colors.blue,
                  icon: Icons.favorite,
                  title: "Arrived",
                  data: "698",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    ),
  );
}

Container _buildHeader() {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      color: Colors.blue,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(
            "Dashboard",
          ),
          trailing: CircleAvatar(
            radius: 25.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            "Dr. John Doe",
          ),
        ),
        const SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            "Md, (General Medium), DM\n(Cardiology)",
          ),
        ),
      ],
    ),
  );
}

Container _buildTile({Color color, IconData icon, String title, String data}) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    height: 150.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      color: color,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          title,
        ),
        Text(
          data,
        ),
      ],
    ),
  );
}
