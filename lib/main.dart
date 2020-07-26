import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  // Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(StyleTransferApp(firstCamera));
}

class StyleTransferApp extends StatelessWidget {

  final CameraDescription _camera;

  StyleTransferApp(this._camera);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Style Transfer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Style Transfer Flutter'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _visible = false;

  void _incrementCounter() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(_visible)
              Text(
                'Hello World',
                style: Theme.of(context).textTheme.headline4,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: _visible ? Icon(Icons.remove): Icon(Icons.add),
      ),
    );
  }
}
