import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage_ujilvl/details.dart';

class listpage extends StatefulWidget {
  const listpage({Key? key}) : super(key: key);

  @override
  _listpageState createState() => _listpageState();
}

class _listpageState extends State<listpage> {
  String url = 'http://great-wondering.at.ply.gg:42680/api/konseling';
  String _errorMessage = '';

  Future<void> _logout() async {
    try {
      // URL endpoint login dari backend Laravel
      String loginUrl = 'http://great-wondering.at.ply.gg:42680/api/auth/logout';

      // Mengirim permintaan POST ke backend Laravel
      var response = await http.post(
        Uri.parse(loginUrl),
      );

      // Mengecek kode status respons
      if (response.statusCode == 200) {
        // Permintaan berhasil, dapatkan token dari respons
        var token = response.body;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  listpage()), // Ganti NextPage dengan halaman berikutnya yang ingin ditampilkan setelah login berhasil
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

  Future<List<dynamic>> getProducts() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    return data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "List Jadwal",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 900,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                _logout();
              },
              child: Container(
                width: 9999,
                height: 77,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 142, 195, 218),
                  borderRadius: BorderRadius.circular(17),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back,",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "John Doe",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Container(
                      width: 57,
                      height: 57,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 43, 86, 186),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 9999,
              height: 57,
              decoration: BoxDecoration(
                color: Color(0xff352647),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "History Pertemuan",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    var productList = snapshot.data!;
                    return ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        var item = productList[index];
                        return Container(
                          width: 9999,
                          height: 109,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                spreadRadius: -3,
                                blurRadius: 12,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ],
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['deskripsi']),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    height: 23,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xff77CE96),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(item['status']),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.circle,
                                    size: 7,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5),
                                  Text("Status"),
                                  Spacer(flex: 3),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  detailpage())); // G
                                    },
                                    child: Container(
                                      height: 23,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 206, 119, 119),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text("Details"),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
