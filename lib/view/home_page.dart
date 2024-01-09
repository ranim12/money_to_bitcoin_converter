import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_to_bitcoin_converter/controller/conversion_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(ConversionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Bitcoin Coverter App",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value == true
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset("assets/images/cover.png")),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.monetization_on),
                            border: OutlineInputBorder(),
                            labelText: "USD to Bitcoin",
                            hintText: '150'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value == "") {
                            controller.usdToBitcoin(0.0);
                          }
                          controller.usdToBitcoin(double.parse(value));
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${controller.usdAmount} Bitcoin",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.euro),
                            border: OutlineInputBorder(),
                            labelText: "Euro to Bitcoin",
                            hintText: '150'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value == "") {
                            controller.euroToBitcoin(0.0);
                          }
                          controller.euroToBitcoin(double.parse(value));
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${controller.euroAmount} bitcoin",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.money),
                            border: OutlineInputBorder(),
                            labelText: "GBP to Bitcoin",
                            hintText: '150'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value == "") {
                            controller.poundToBitcoin(0.0);
                          }
                          controller.poundToBitcoin(double.parse(value));
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${controller.gbpAmount} bitcoin",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
