import 'package:dev_dash/utils/snackbar_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateApp extends StatelessWidget {
  const RateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Feedback',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/five_star_rating.png'),
                height: 200,
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Rate DevDash App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child:  RatingBarIndicator(
                  rating: 5,
                  itemSize: 52,
                  itemPadding: const EdgeInsets.all(8),
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write Review',
                  hintStyle: const TextStyle(color: Colors.black),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              padding: const EdgeInsets.only(top: 50),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: Colors.deepPurpleAccent,
                  elevation: 5,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  snackbarShow(context, 'Thanks for Rating');
                },
                child: const Text(
                  'Submit Feedback',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
