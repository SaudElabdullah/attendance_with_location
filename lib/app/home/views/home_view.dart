import 'package:attendance_with_location/app/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController(
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 400,
              child: Icon(
                controller.inPlace ? Icons.location_on : Icons.location_off,
                size: 50,
                color: Colors.blueGrey,
              ),
            ),
            Positioned(
              top: 500,
              child: Text(
                controller.inPlace ? 'You are in place' : 'You are not in place',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              child: TextButton(
                onPressed: (){
                  controller.logout();
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
