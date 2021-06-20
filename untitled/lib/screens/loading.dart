import 'package:flutter/material.dart';
import 'package:untitled/data/my_location.dart';
import 'package:untitled/data/network.dart';
import 'package:untitled/screens/weather_screen.dart';

const String openWeatherAPIKey = '0d0cc1131b44cd6ea0027e60e69dc007';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double latitude3 = 0.0;
  double longitude3 = 0.0;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=${latitude3}&lon=${longitude3}&appid=${openWeatherAPIKey}&units=metric');

    var weatherData = await network.getJsonData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(parseWeatherData: weatherData,);
    }));
  }

  // void fetchData() async {
  //   var url = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     String jsonData = response.body;
  //     var myJson = jsonDecode(jsonData);
  //     print(myJson);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () { },
        child: Text(
          'Get my location',
          style: TextStyle(color: Colors.orange),
        ),
      )),
    );
  }
}