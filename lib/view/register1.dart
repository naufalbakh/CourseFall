import 'package:flutter/material.dart';
import 'package:banyuwangikuliner/view/login.dart';
import 'package:dio/dio.dart';
import 'package:hexcolor/hexcolor.dart';

class Register1 extends StatefulWidget {
  @override
  State<Register1> createState() => _RegisterState();
}

class _RegisterState extends State<Register1> {
  // Untuk inisialisasi controller, yang akan diletakkan di text field
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  // method register
  void register(String email, password) async {
    try {
      // ME-POST atau MENAMBAH data json dari link
      var response = await Dio().post('http://localhost:3000/user',
          data: {"email": email, "password": password});
      if (response.statusCode == 201) {
        // status code 201 karena berhasil membuat data baru
        print("Account created successfully");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login(),
        ));
      } else {
        print("Registration Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          decoration: BoxDecoration(
              image: DecorationImage(
            // opacity: 50,
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "CourseFall",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  )),
              // SizedBox(height: 13),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "Banyuwangi Kuliner",
              //     style: TextStyle(
              //         color: Color.fromARGB(255, 255, 255, 255),
              //         fontSize: 17,
              //         fontWeight: FontWeight.normal),
              //   ),
              // ),
              SizedBox(height: 25),
              TextField(
                // memanggil controller
                controller: controllerEmail,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Email Address",
                  hintText: "Email Address",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 18),
              TextField(
                // memanggil controller
                controller: controllerPass,
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Password",
                  hintText: "Password",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
                obscureText: true,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // memanggil method register, dengan parameter yg sudah diinputkan melalui text field
                  register(controllerEmail.text, controllerPass.text);
                },
                child: Text("SIGN UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                style: ElevatedButton.styleFrom(
                    primary: HexColor('067AE6'),
                    minimumSize: const Size.fromHeight(55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                      )),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                    },
                    child: Text("Log In",
                        style: TextStyle(
                          fontSize: 16,
                          color: HexColor('067AE6'),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
