import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:techviz/AboutUs.dart';

class homeBody extends StatefulWidget {
  const homeBody({super.key});

  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
  String _selectedMode = "Object Detection";
  double _soundLevel = 0.4;
  double _sensorRange = 50.0;

  TextEditingController _controller = TextEditingController();
  String _output = '';
  String _error = '';

  Future<void> _sendCommand(String command, {double? sensorRange}) async {
    final url = Uri.parse('http://192.168.188.136:5000/execute');
    final body = {'command': command};
    if (sensorRange != null) {
      body['sensor_range'] = sensorRange as String;
    }

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _output = data['output'];
        _error = data['error'];
      });
    } else {
      final data = json.decode(response.body);
      setState(() {
        _error = data['error'] ?? 'Failed to execute command';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Modes:', style: TextStyle(fontSize: 18)),
                        SizedBox(width: 8),
                        Expanded(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedMode,
                            items: <String>[
                              'Object Detection',
                              'Sensor Mode',
                              'Object Detection with Sensor Mode'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedMode = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    if (_selectedMode == 'Sensor Mode' || _selectedMode == 'Object Detection with Sensor Mode')
                      Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Text('Sensor Range:', style: TextStyle(fontSize: 18)),
                              Expanded(
                                child: Slider(
                                  value: _sensorRange,
                                  min: 0.0,
                                  max: 100.0,
                                  divisions: 100,
                                  label: _sensorRange.round().toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      _sensorRange = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    SizedBox(height: 20),
                    Visibility(
                      visible: true,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (_selectedMode == 'Object Detection')
                                    _sendCommand('python 1.py');

                                  else if (_selectedMode == 'Sensor Mode')
                                    _sendCommand('python 1.py', sensorRange: _sensorRange);

                                  if (_selectedMode == 'Object Detection with Sensor Mode')
                                    _sendCommand('python 1.py', sensorRange: _sensorRange);
                                },
                                child: Text('Start'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _sendCommand("lsof | grep /path/to/your/file | awk '{print \$2}' | xargs kill -9");
                                },
                                child: Text('End'),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text('Output:'),
                          Text(_output),
                          SizedBox(height: 20),
                          Text('Error:'),
                          Text(_error, style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Sound:', style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Slider(
                            value: _soundLevel,
                            min: 0.0,
                            max: 1.0,
                            divisions: 100,
                            label: (_soundLevel * 100).round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _soundLevel = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: <Widget>[
                        Text('Scan Your Room:', style: TextStyle(fontSize: 18)),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Your scan functionality here
                          },
                          child: Text('Scan'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
              child: Image.asset('assets/img.png', height: 50),
            ),
            SizedBox(height: 8),
            Text('About Us', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
