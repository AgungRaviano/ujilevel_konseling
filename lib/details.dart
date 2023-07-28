import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class detailpage extends StatelessWidget {
   detailpage({Key? key}) : super(key: key);

  String url = 'http://great-wondering.at.ply.gg:42680/api/konseling';

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
              "Details",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 900,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
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
            SizedBox(
              height: 30,
            ),
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
                          height: 209,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 144, 242, 178),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['deskripsi']),
                              SizedBox(
                                height: 10,
                              ),
                              Text(item['tanggal_konseling']),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 23,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 44, 209, 61),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Selesai",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(item['hasil_konseling']),
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 122, 56, 24),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
