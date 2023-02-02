import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'color_constants.dart';
import 'my_model.dart';

class MySelf extends StatefulWidget {
  const MySelf({super.key});

  @override
  State<MySelf> createState() => _MySelfState();
}

class _MySelfState extends State<MySelf> {
  MyModel myModel = const MyModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasan Basri DARGA"),
        backgroundColor: mainBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Please click the picture",
            style: TextStyle(
              color: mainBlue,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FlipCard(
            front: Image.asset(
              'assets/myFoto.png',
              fit: BoxFit.cover,
            ),
            back: myCustomCard(myModel.name, myModel.lastName,
                myModel.yearOfBirth, myModel.job, myModel.gender),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'introducing_character');
            },
            style: const ButtonStyle(),
            child: Text(
              'Next Page',
              style: TextStyle(
                color: darkBlue,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myCustomCard(String name, String lastName, int yearOfBirth, String job,
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
              "İsim :  $name",
              style: TextStyle(
                color: mainWhite,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Soyisim : $lastName",
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
              "Doğum Yılı : ${yearOfBirth.toString()}",
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
              "Meslek : $job",
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
              "Cinsiyet : $gender",
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
