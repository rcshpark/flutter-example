import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatelessWidget {
  const TestApi({Key? key}) : super(key: key);

  void _callAPI() async {
    var url = Uri.parse(
      'https://raw.githubusercontent.com/dev-yakuza/users/master/api.json',
    );
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    url = Uri.parse('https://reqbin.com/sample/post/json');
    response = await http.post(url, body: {
      //프론트에서 서버로 주는 정보
      'key': 'value',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _callAPI,
          child: const Text('Call API'),
        ),
      ),
    );
  }
}
