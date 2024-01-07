import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/home/bloc/home_bloc.dart';
import 'package:weather_app/screens/home/ui/home_screen_widgets/backdrop_widget.dart';
import 'package:weather_app/screens/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: _determinePosition(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BlocProvider<HomeBloc>(
                create: (context) => HomeBloc()
                  ..add(FetchWeatherDataEvent(
                      position: snapshot.data as Position)),
                child: const Home(),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                  backgroundColor: Colors.black,
                  body: Padding(
                      padding:
                          EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
                      child: SizedBox(
                        child: Stack(
                          children: [
                            BackdropWidget(),
                            Center(
                                child: SpinKitSpinningLines(
                              color: Colors.grey,
                            )),
                          ],
                        ),
                      )));
            } else {
              return Scaffold(
                backgroundColor: Colors.black,
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 1.2 * kToolbarHeight, 40, 20),
                  child: SizedBox(
                    child: Stack(children: [
                      const BackdropWidget(),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                "assets/images/geolocation-permission.png",scale: 3,),
                            const Text('Enable Geolocation',style: TextStyle(fontSize: 16,color: Colors.white54),),
                            const Text('to use our weather service app',style: TextStyle(fontSize: 12,color: Colors.white54),),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            }
          },
        ));
  }

  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
