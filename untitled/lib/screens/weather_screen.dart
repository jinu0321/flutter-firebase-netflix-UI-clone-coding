import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;

  WeatherScreen({this.parseWeatherData});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;
  late String des;
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();
    cityName = weatherData['name'];
    des = weatherData['weather'][0]['description'];
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Text(
                          '$cityName',
                          style: GoogleFonts.lato(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            TimerBuilder.periodic(Duration(minutes: 1),
                                builder: (context) {
                              print(getSystemTime());
                              return Text(
                                '${getSystemTime()}',
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              );
                            }),
                            Text(
                              DateFormat(' - EEEE').format(date),
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              DateFormat(', d MMMM, yyy').format(date),
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$temp\u2103',
                          style: GoogleFonts.lato(
                            fontSize: 85,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/climacon-sun.svg'),
                            SizedBox(width: 10),
                            Text(
                              '$des',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'AQI(대기질 지수)',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/image/bad.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Text(
                              '\"매우나쁨\"',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '미세먼지',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '147.75',
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '㎍/㎥',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '초미세먼지',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '84.03',
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '㎍/㎥',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
