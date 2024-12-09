import 'package:flutter/material.dart';
import 'package:moengage_cards/moengage_cards.dart' as moecards;
import 'package:moengage_flutter/moengage_flutter.dart';
import 'package:moengage_geofence/moengage_geofence.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void _onInAppClick(ClickData message) {
  print("This is a inapp click callback from native to flutter. Payload " +
      message.toString());
}

void _onInAppShown(InAppData message) {
  print("This is a callback on inapp shown from native to flutter. Payload " +
      message.toString());
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  moecards.MoEngageCards cards =
      moecards.MoEngageCards("8SIW681S80Z08KSHQFSTIZ8T");

  // final MoEngageFlutter _moengagePlugin =
  //     MoEngageFlutter("8SIW681S80Z08KSHQFSTIZ8T");

  MoEngageFlutter _moengagePlugin = MoEngageFlutter('8SIW681S80Z08KSHQFSTIZ8T',
      moEInitConfig: MoEInitConfig(
          pushConfig:
              PushConfig(shouldDeliverCallbackOnForegroundClick: true)));

  final MoEngageGeofence _moEngageGeofence =
      MoEngageGeofence('8SIW681S80Z08KSHQFSTIZ8T');

  @override
  void initState() {
    super.initState();
    _moengagePlugin.setInAppClickHandler(_onInAppClick);
    _moengagePlugin.setInAppShownCallbackHandler(_onInAppShown);
    _moengagePlugin.configureLogs(LogLevel.VERBOSE,
        isEnabledForReleaseBuild: true);
    _moengagePlugin.initialise();
    cards.initialize();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MoE Mirrors: Lat v1.0"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const Text(
              'Hellow There!!',
            ),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.enableAdIdTracking();
                },
                child: Text("Enable AD ID Tracking")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.disableAdIdTracking();
                },
                child: Text("Disable AD ID Tracking")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setAppStatus(MoEAppStatus.install);
                },
                child: Text("Track INSTALL")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setAppStatus(MoEAppStatus.update);
                },
                child: Text("Track UPDATE")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setUniqueId("moe_flutter_user@moengage.com");
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.logout();
                },
                child: Text("Logout")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin
                      .setAlias("moe_user_flutter_aliasing@gmail.com");
                },
                child: Text("setAlias")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setFirstName("Pushpendra");
                },
                child: Text("Set First Name")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setLastName("A");
                },
                child: Text("Set Last Name")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setEmail("trainingSDK@moengge.com");
                },
                child: Text("Set Email")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setPhoneNumber("9348626210");
                },
                child: Text("Set Phone number")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setGender(MoEGender.male);
                },
                child: Text("Set Gender")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.setUserAttribute("framework", "Flutter");
                  _moengagePlugin.setUserAttribute("year", 2024);
                  _moengagePlugin.setUserAttribute(
                      "device_vendor", "Google/Pixel");
                },
                child: Text("Track Custom Attributes")),
            ElevatedButton(
                onPressed: () {
                  var props = MoEProperties();
                  props.addAttribute("Pineapple", "12");
                  props.addAttribute("Apple", "12");
                  props.addAttribute("iPhone", "69000");

                  _moengagePlugin.trackEvent("Purchase", props);
                },
                child: Text("Purchase event track")),
            ElevatedButton(
                onPressed: () {
                  var props = MoEProperties();
                  props.addAttribute("Pineapple", "12");
                  props.addAttribute("Apple", "12");
                  props.addAttribute("iPhone", "69000");
                  props.setNonInteractiveEvent();

                  _moengagePlugin.trackEvent("Purchase Non Interacive", props);
                },
                child: Text("Purchase non-interactive event")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.requestPushPermissionAndroid();
                },
                child: Text("Request Push Permission")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.navigateToSettingsAndroid();
                },
                child: Text("Navigate to Settings for Push Permission")),
            ElevatedButton(
                onPressed: () {
                  _moengagePlugin.showInApp();
                },
                child: Text("Show InApp")),
            ElevatedButton(
                onPressed: () {
                  _moEngageGeofence.startGeofenceMonitoring();
                },
                child: Text("Start Geofence monitoring")),
            ElevatedButton(
                onPressed: () {
                  _moEngageGeofence.stopGeofenceMonitoring();
                },
                child: Text("Stop Geofence Monitoring"))
          ],
        ),
      ),
    );
  }
}
