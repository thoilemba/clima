import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';
import 'location_screen.dart';

// private api key from openweathermap
const apiKey = '19a7d66b90d249098a0b45ca28681e61';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

//TODO: this is the homepage of the app
class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    Location location = Location();
    // getting location of the user
    await location.getCurrentLocation();
    latitude = location.latitude!;
    longitude = location.longitude!;
    // fetching the data
    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?''lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    // sending this weather to the location screen
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));

  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
