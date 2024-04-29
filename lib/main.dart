import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/constant.dart';
import 'app/data/state_holder_binding.dart';
import 'app/modules/bottom_nav_bar/view/bottom_nav.dart';
import 'app/modules/home_screen/view/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const RajdhaniTv());
}

class RajdhaniTv extends StatefulWidget {
  const RajdhaniTv({super.key});

  @override
  State<RajdhaniTv> createState() => _RajdhaniTvState();
}

class _RajdhaniTvState extends State<RajdhaniTv> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Rajdhani Tv',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(10)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
        ),
        themeMode: ThemeMode.system,
        getPages: [GetPage(name: '/', page: () => BottomNav())],
        initialRoute: '/',
        initialBinding: StateHolderBinding(),
      );
    });
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  List fData = [
    {'icon': Icons.ac_unit, 'name': "UPI"},
    {'icon': Icons.qr_code_scanner, 'name': "Scan"},
    {'icon': Icons.account_balance_wallet_outlined, 'name': "Balance"},
    {'icon': Icons.transfer_within_a_station_outlined, 'name': "Transactions"},
    {'icon': Icons.screen_lock_landscape, 'name': "Quick Loan"},
  ];
  List sData = [
    {'icon': Icons.recycling_sharp, 'name': "Electricity"},
    {'icon': Icons.mobile_friendly, 'name': "Recharge"},
    {'icon': Icons.closed_caption_off_sharp, 'name': "School Fees"},
    {'icon': Icons.movie_outlined, 'name': "Movie"},
  ];
  List tData = [
    {'icon': Icons.bus_alert, 'name': "Bus"},
    {'icon': Icons.flight, 'name': "Flight"},
    {'icon': Icons.train, 'name': "Train"},
    {'icon': Icons.movie_outlined, 'name': "Movie Reels"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Katayama Fumiki',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            Text(
              'AC NO: xxxxxxxxx732',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: FlutterLogo(),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Send Money',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Request Money',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            fData.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.black26,
                                          child: Icon(
                                            fData[index]['icon'],
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        fData[index]['name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      )
                                    ],
                                  ),
                                )),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 18.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/news.jpg'),
                        fit: BoxFit.cover)),
                height: 200,
              ),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'QUICK PAYMENT',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      sData.length,
                      (index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white38,
                                      child: Icon(
                                        sData[index]['icon'],
                                        color: Colors.blue,
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  sData[index]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                )
                              ],
                            ),
                          )),
                )),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      tData.length,
                      (index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white38,
                                      child: Icon(
                                        tData[index]['icon'],
                                        color: Colors.blue,
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  tData[index]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                )
                              ],
                            ),
                          )),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home_filled,
              size: 30,
              color: Colors.blue.shade200,
            ),
            Icon(Icons.featured_play_list, size: 30, color: Colors.black45),
            Icon(Icons.list_alt, size: 30, color: Colors.black45),
            Icon(Icons.contact_phone, size: 30, color: Colors.black45),
          ],
        ),
      ),
    );
  }
}