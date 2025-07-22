import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final TextEditingController _controller = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 0.0),
              child: TextField(
                controller: _controller, 
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  icon: Icon(Icons.location_city_sharp, size: 30),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              child: const Text('Get Weather', style: TextStyle(fontSize: 22)),
              onPressed: () {
                String cityName = _controller.text.trim(); // TextField'dan al
                Navigator.pop(context, cityName); // doğru veriyi geri gönder
              },
            )
          ],
        ),
      ),
    );
  }
}
