import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'color_constants.dart';
import 'model.dart';

class InfoCharacter extends StatefulWidget {
  const InfoCharacter({super.key});

  @override
  State<InfoCharacter> createState() => _InfoCharacterState();
}

Future<Character> apiCall() async {
  const String url = "https://hp-api.onrender.com/api/characters";
  var res = await http.get(Uri.parse(url));

  if (res.statusCode == 200 || res.statusCode == 304) {
    // en son istekten sonra değişiklik olmamış 304
    var jsonBody = jsonDecode(res.body);
    return Character.fromJson(jsonBody[1]);
  } else {
    throw Exception('Bir hata oluştu!!!');
  }
}

class _InfoCharacterState extends State<InfoCharacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        title: const Text("Hermione Granger"),
        backgroundColor: mainBlue,
      ),
      body: FutureBuilder<Character>(
        future: apiCall(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please click the picture",
                    style: TextStyle(
                      color: mainWhite,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: Image.network(
                      snapshot.data!.image!,
                    ),
                    back: customCard(
                        snapshot.data!.name,
                        snapshot.data!.yearOfBirth,
                        snapshot.data!.actor,
                        snapshot.data!.species,
                        snapshot.data!.gender),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'introducing_myself');
                    },
                    child: Text(
                      'Next Page',
                      style: TextStyle(
                        color: secondWhite,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child:
                CircularProgressIndicator(), // loading olurken gecikme kısmı için
          );
        },
      ),
    );
  }

  Widget customCard(String name, int yearOfBirth, String actor, String species,
      String gender) {
    return Material(
      elevation: 50,
      borderRadius: BorderRadius.circular(20),
      color: mainBlue,
      child: SizedBox(
        height: 450,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name :  $name",
              style: TextStyle(
                color: secondWhite,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Year Of Birth : ${yearOfBirth.toString()}",
              style: TextStyle(
                color: mainWhite,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Actor : $actor",
              style: TextStyle(
                color: secondWhite,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Species : $species",
              style: TextStyle(
                color: mainWhite,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Gender : $gender",
              style: TextStyle(
                color: mainWhite,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
