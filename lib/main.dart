import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trappist_extra/pages/home.dart';
import 'package:trappist_extra/models/chain.dart';

void main() {
  // Define the available chains
/*
  var vara = SoloChain("Vara Network", chainSpec("vara.json"),
          logo("vara.svg", "Vara Logo"));
  var shibuya = SoloChain("Shibuya Testnet", chainSpec("shibuya.json"),
          logo("shiden.png", "Shibuya Logo"));
*/
  var polkadot = RelayChain("Polkadot", chainSpec("polkadot.json"),
          logo("polkadot.svg", "Polkadot Logo"))
      // Astar
      // .addParachain("Astar", chainSpec("astar.json"),
      //     logo("polkadot.svg", "Astar Logo"))
      // Statemint
      .addParachain("AssetHubPolkadot", chainSpec("asset-hub-polkadot.json"),
          logo("statemint.svg", "Statemint Logo"))
      // BridgeHub
      .addParachain("BridgeHubPolkadot", chainSpec("bridge-hub-polkadot.json"),
          logo("bridgehub-polkadot.svg", "BridgeHub Logo"));
  var kusama = RelayChain(
          "Kusama", chainSpec("kusama.json"), logo("kusama.svg", "Kusama Logo"))
      // Shiden
      // .addParachain("Shiden", chainSpec("shiden.json"),
      //     logo("kusama.svg", "Shiden Logo"))
      // Statemine
      .addParachain("Kusama Asset Hub", chainSpec("asset-hub-kusama.json"),
          logo("statemint.svg", "Statemine Logo"))
      // BridgeHub
      .addParachain("BridgeHubKusama", chainSpec("bridge-hub-kusama.json"),
          logo("bridgehub-kusama.svg", "BridgeHub Logo"));

  var westend = RelayChain(
          "Westend", chainSpec("westend.json"), logo("rococo.svg", "Rococo Logo"))
      // Statemine
      .addParachain("AssetHubWestend", chainSpec("asset-hub-westend.json"),
          logo("statemint.svg", "Rockmine Logo"))
      // BridgeHub
      .addParachain("BridgeHubWestend", chainSpec("bridge-hub-westend.json"),
          logo("bridgehub-kusama.svg", "BridgeHub Logo"));

  var rococo = RelayChain(
          "Rococo", chainSpec("rococo.json"), logo("rococo.svg", "Rococo Logo"))
      // Statemine
      .addParachain("AssetHubRococo", chainSpec("asset-hub-rococo.json"),
          logo("statemint.svg", "Rockmine Logo"))
      // BridgeHub
      .addParachain("BridgeHubRococo", chainSpec("bridge-hub-rococo.json"),
          logo("bridgehub-kusama.svg", "BridgeHub Logo"));

  runApp(ChangeNotifierProvider(
      // create: (context) => Chains([vara, shibuya, polkadot, kusama, rococo]),
      create: (context) => Chains([polkadot, kusama, westend, rococo]),
      child: const MyApp()));
}

String chainSpec(String fileName) {
  return "assets/chainspecs/$fileName";
}

Widget logo(String assetName, String semanticsLabel) {
  assetName = "assets/images/logos/$assetName";
  if (assetName.endsWith(".svg")) {
    // Note: use https://crates.io/crates/usvg to convert the source svg if not
    // displaying correctly due to lack of CSS support in flutter_svg package
    return SvgPicture.asset(
      assetName,
      semanticsLabel: semanticsLabel,
      height: 42,
      width: 42,
      fit: BoxFit.fitWidth,
    );
  }
  return Image(
    image: AssetImage(assetName),
    semanticLabel: semanticsLabel,
    height: 42,
    width: 42,
    fit: BoxFit.fitWidth,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trappist Extra',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink,
          fontFamily: 'Syncopate',
          dividerColor: Colors.transparent),
      home: const HomePage(title: 'Trappist Extra'),
    );
  }
}
