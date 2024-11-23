import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/location/presentation/controllers/location_provider.dart';
import 'package:weather/weather/presentation/screens/weather_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationTextController = TextEditingController();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Location",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF111634),
                  Color(0xFF514F77),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: EdgeInsets.all(
                    16.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(20, 217, 217, 217),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownMenu(
                        controller: locationTextController,
                        requestFocusOnTap: true,
                        inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                        ),
                        hintText: "Select your city",
                        dropdownMenuEntries: [
                          for (var city
                              in context.read<LocationProvider>().allCities)
                            DropdownMenuEntry(
                              value: city,
                              label: city,
                            ),
                        ],
                        onSelected: (value) {
                          context.read<LocationProvider>().setLocation(
                                value,
                                0,
                                0,
                              );
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Confirm",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
