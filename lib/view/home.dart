import 'package:flutter/material.dart';
import 'package:banyuwangikuliner/view/login.dart';
import 'package:banyuwangikuliner/service/apiservice.dart';
import 'package:banyuwangikuliner/model/course.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:js' as js;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<Course>? course;

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabcontroller.dispose();
  }

  void _url(String url) {
    js.context.callMethod('open', ['${url}']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Banyuwangi Kuliner'),
      //   // title:
      //   // const Text('Banyuwangi Kuliner'),
      //   backgroundColor: HexColor('522206'),
      // ),
      bottomNavigationBar: Material(
        color: HexColor('4FBABA'),
        child: TabBar(
          controller: tabcontroller,
          tabs: [
            Tab(
                icon: GestureDetector(
              child: Icon(Icons.home),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  )),
            )),
            Tab(
                icon: GestureDetector(
              child: Icon(Icons.book),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  )),
            )),
            Tab(
                icon: GestureDetector(
              child: Icon(Icons.account_balance_rounded),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  )),
            )),
          ],
        ),
      ),
      body: FutureBuilder<List<Course>>(
          future: ApiService().fetchDataCourse(),
          builder: (context, snapshot) {
            //loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Masih Loading...');
            } else {
              //error
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                //berhasil
                return Stack(
                  children: [
                    Container(
                      color: HexColor('CAD6DF'),
                      // width: double.infinity,
                    ),
                    Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome To",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "CourseFall",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  labelText: "Enter Your Course",
                                  // fillColor: Colors.white,l
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 160),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 180, left: 30, right: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  width: double.infinity,
                                  height: 230,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Frontend \nDeveloper",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Center(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/Frontend-icon.png"),
                                          width: 130,
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: HexColor('067AE6'),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                flex: 1,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  width: double.infinity,
                                  height: 230,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Backend \nDeveloper",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Center(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/Backend-icon.png"),
                                          width: 130,
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: HexColor('4FBABA'),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                flex: 1,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 15,
                                    ),
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () =>
                                          _url("${snapshot.data![index].url}"),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 60,
                                            child: Row(
                                              children: [
                                                Container(
                                                  // padding: EdgeInsets.all(10),
                                                  width: 60,
                                                  // color: Colors.red,
                                                  child: Image(
                                                    image: AssetImage(
                                                        '${snapshot.data![index].img}'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${snapshot.data![index].nama}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        "${snapshot.data![index].level}"),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                itemCount: snapshot.data!.length),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                              color: HexColor('027CEA'),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Exit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Icon(
                                Icons.logout,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment:,
                    // )
                  ],
                );
              }
            }
          }),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Fakultas Sains dan Teknologi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: const Text('HOME'),
                onTap: () => print('Tap Trash menu')),
            ListTile(
              leading: Icon(Icons.school),
              title: const Text('Teknik Informatika'),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => InformatikaPage(),
                //     ));
              },
            ),
            ListTile(
                leading: Icon(Icons.school),
                title: const Text('Teknik Arsitektur'),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new InformatikaPage()));
                }),
            new Divider(),
            GestureDetector(
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                trailing: new Icon(Icons.cancel),
                title: const Text('LOGOUT'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
