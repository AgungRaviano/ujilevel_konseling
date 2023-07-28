import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage_ujilvl/listpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  Future<void> _login() async {
    try {
      // URL endpoint login dari backend Laravel
      String loginUrl = 'http://great-wondering.at.ply.gg:42680/api/auth/login';

      // Membuat body permintaan dengan email dan password
      var body = {
        'email': _emailController.text,
        'password': _passwordController.text,
      };

      // Mengirim permintaan POST ke backend Laravel
      var response = await http.post(Uri.parse(loginUrl), body: body);

      // Mengecek kode status respons
      if (response.statusCode == 200) {
        // Permintaan berhasil, dapatkan token dari respons
        var token = response.body;
 Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => listpage()), // Ganti NextPage dengan halaman berikutnya yang ingin ditampilkan setelah login berhasil
        );
        // Lakukan sesuatu dengan token, misalnya menyimpannya di penyimpanan lokal
        // atau melakukan navigasi ke halaman berikutnya

        // ...
      } else {
        // Permintaan gagal, tampilkan pesan kesalahan
        setState(() {
          _errorMessage = 'Login failed';
        });
      }
    } catch (error) {
      // Terjadi kesalahan selama permintaan, tampilkan pesan kesalahan
      setState(() {
        _errorMessage = 'Error: $error';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color(0xffF6F4FF),
          child: ListView(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'Assets/images/loginbgf.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                      top: 140,
                      left: 30,
                      right: 30,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Solution",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff8BD0FF)),
                              ),
                              Text(
                                "Mind",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            "Guidance and Counseling (BK) is a service provided in various educational institutions, such as schools, colleges, or learning centers.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 227, 227, 227)),
                          )
                        ],
                      ))
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    // <-- SEE HERE
                    width: 900,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  SizedBox(
                    // <-- SEE HERE
                    width: 900,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  GestureDetector(
                    onTap: () {
                      _login();
                    },
                    child: Container(
                        height: 40,
                        child: ElevatedButton(
                                  onPressed: _login,
                            child: Center(
                              child: Text("Login"),
                            ))),
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
