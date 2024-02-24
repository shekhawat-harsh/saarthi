import 'package:flutter/material.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    var scWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const Image(image: AssetImage("assets/images/feet.png")),
            const SizedBox(
              height: 160,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20))))),
                  onPressed: () {},
                  child: const SizedBox(
                      height: 74,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Step Length",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "13.5m",
                            style: TextStyle(
                                color: Color.fromARGB(128, 255, 255, 255)),
                          )
                        ],
                      )),
                ),
                const SizedBox(width: 2),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(20))))),
                    onPressed: () {},
                    child: const SizedBox(
                        height: 74,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Stride Length",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "13.5m",
                              style: TextStyle(
                                  color: Color.fromARGB(128, 255, 255, 255)),
                            )
                          ],
                        ))),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20))))),
                  onPressed: () {},
                  child: SizedBox(
                      width: scWidth / 6,
                      height: 70,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dorsiflexion",
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "13.5m",
                            style: TextStyle(
                                color: Color.fromARGB(128, 255, 255, 255)),
                          )
                        ],
                      )),
                ),
                const SizedBox(width: 2),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))))),
                  onPressed: () {},
                  child: SizedBox(
                      width: scWidth / 6,
                      height: 70,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Stride Length",
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "13.5m",
                            style: TextStyle(
                                color: Color.fromARGB(128, 255, 255, 255)),
                          )
                        ],
                      )),
                ),
                const SizedBox(width: 2),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20))))),
                  onPressed: () {},
                  child: SizedBox(
                      height: 70,
                      width: scWidth / 6,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Stride Length",
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "13.5m",
                            style: TextStyle(
                                color: Color.fromARGB(128, 255, 255, 255)),
                          )
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
