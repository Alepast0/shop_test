import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomBar extends StatefulWidget {
  const CustomBar({Key? key}) : super(key: key);

  @override
  State<CustomBar> createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomBar> {
  String cityName = 'Loading...';

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    PermissionStatus permissionStatus = await Permission.locationWhenInUse.status;

    if (permissionStatus.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double latitude = position.latitude;
      double longitude = position.longitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      cityName = placemarks[0].locality ?? 'Unknown';

      setState(() {});
    } else {
      if (permissionStatus.isDenied) {
        await Permission.locationWhenInUse.request();
      } else {
        await Permission.locationWhenInUse.request();
      }

      permissionStatus = await Permission.locationWhenInUse.status;

      if (permissionStatus.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        double latitude = position.latitude;
        double longitude = position.longitude;

        List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

        cityName = placemarks[0].locality ?? 'Unknown';

        setState(() {});
      } else {
        print('Не удалось получить разрешение на доступ к местоположению');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return             SizedBox(
      height: 101,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 57),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 52, left: 8.5, bottom: 0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cityName,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Text(
                        DateFormat('d MMMM, yyyy', 'ru_RU').format(DateTime.now()),
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 51),
            child: SizedBox(
              width: 44,
              height: 44,
              child: Image.asset("assets/images/user.png"),
            ),
          )
        ],
      ),
    );
  }
}
