import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:banyuwangikuliner/view/home.dart';
import 'package:banyuwangikuliner/view/register1.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void login(String email, password) async {
    try {
      // ME-GET atau Mengambil data json dari link
      var response = await Dio().get('http://localhost:3000/user');
      // var response = await Dio().get('http://10.0.2.2:3000/users');
      // inisialisasi panjang data
      var panjang_data = response.data.length;
      if (response.statusCode == 200) {
        // pengecekan dengan perulangan dan percabangan,
        // input akan dicek dari semua data yg sudah ada di json
        for (var i = 0; i <= panjang_data; i++) {
          if (email == response.data[i]['email'] &&
              password == response.data[i]['password']) {
            print("Login success");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
            break;
          }
        }
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Login failed',
            // style: GoogleFonts.lexend(
            //   fontWeight: FontWeight.normal,
            //   fontStyle: FontStyle.normal,
            //   color: Colors.white,
            // ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          'Login failed',
          // e.toString(),
          // style: GoogleFonts.lexend(
          //   fontWeight: FontWeight.normal,
          //   fontStyle: FontStyle.normal,
          //   color: Colors.white,
          // ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // ThemeData themeData = ThemeData.light();

  // void setTheme(bool isDarkmode) {
  //   setState(() {
  //     themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
  //     SharedPref.pref?.setBool('isDarkmode', isDarkmode);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          children: <Widget>[
            // Image.asset('../assets/logo.png',height: 50,),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text("CourseFall",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w600)),
                  // Image.asset("lib/images/sego_tempong.png",
                  //     height: 250, width: 250),
                ],
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: controllerEmail,
              style: TextStyle(
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
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              obscureText: true,
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
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  color: HexColor('067AE6'),
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                login(controllerEmail.text, controllerPass.text);
              },
              child: Text("LOGIN",
                  style: TextStyle(
                    fontFamily: 'Poppins',
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
                Text("Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: Colors.blueGrey,
                    )),
                SizedBox(width: 7),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Register1(),
                    ));
                  },
                  child: Text("Sign up",
                      style: TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                        color: HexColor('067AE6'),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
