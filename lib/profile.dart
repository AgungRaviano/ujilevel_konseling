import 'package:flutter/material.dart';

class Akuninfo extends StatelessWidget {
  const Akuninfo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 150),
              height: 330,
              width: 500,
              color: Color.fromRGBO(203, 202, 250, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      bottom: 80,
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Aksi saat tombol kembali ditekan
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Color.fromRGBO(69, 69, 69, 100),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(
                      right: 230,
                      bottom: 80,
                    ),
                    child: Text(
                      "Profil",
                      style: TextStyle(
                        color: Color.fromRGBO(69, 69, 69, 100),
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20, bottom: 80),
                    child: TextButton(
                      onPressed: () {
                        // Aksi saat tombol logout ditekan
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Color.fromRGBO(69, 69, 69, 100),
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 80),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(image: AssetImage('images/gensin.jpg')),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 215, top: 230),
                  child: Text(
                    "Raul Evans",
                    style: TextStyle(
                      color: Color.fromRGBO(69, 69, 69, 100),
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 230, top: 260),
                  child: Text(
                    "Siswa",
                    style: TextStyle(
                      color: Color.fromRGBO(69, 69, 69, 100),
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 330, left: 5),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ListTile(
                              leading: Icon(
                                Icons.person_2_outlined,
                                color: Color.fromRGBO(69, 69, 69, 100),
                                size: 22,
                              ),
                              horizontalTitleGap: -6,
                              title: Text(
                                "NIPD",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    color: Color.fromRGBO(150, 142, 142, 100),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "180219678",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              leading: Icon(
                                Icons.email_outlined,
                                color: Color.fromRGBO(69, 69, 69, 100),
                                size: 22,
                              ),
                              horizontalTitleGap: -6,
                              title: Text(
                                "Email",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    color: Color.fromRGBO(150, 142, 142, 100),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "Raul6@gmail.com",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              leading: Icon(
                                Icons.co_present,
                                color: Color.fromRGBO(69, 69, 69, 100),
                                size: 22,
                              ),
                              horizontalTitleGap: -6,
                              title: Text(
                                "Kelas",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    color: Color.fromRGBO(150, 142, 142, 100),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "XI PPLG 2",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              leading: Icon(
                                Icons.calendar_month_sharp,
                                color: Color.fromRGBO(69, 69, 69, 100),
                                size: 22,
                              ),
                              horizontalTitleGap: -6,
                              title: Text(
                                "Tempat Tanggal Lahir",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    color: Color.fromRGBO(150, 142, 142, 100),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "Depok, 21 Oktober 2006",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              leading: Icon(
                                Icons.transgender,
                                color: Color.fromRGBO(69, 69, 69, 100),
                                size: 22,
                              ),
                              horizontalTitleGap: -6,
                              title: Text(
                                "Gender",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    color: Color.fromRGBO(150, 142, 142, 100),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "Pria",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
