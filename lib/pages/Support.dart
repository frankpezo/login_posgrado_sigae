import 'package:flutter/material.dart';

class SupportTeam extends StatelessWidget {
  const SupportTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Sección de soporte. Aquí podemos ayudarlo',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              "assets/images/team.png",
              width: 300,
            ),
          ],
        ),
      )),
    );
  }
}
