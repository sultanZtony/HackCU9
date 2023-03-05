import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rest API Call')),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  void fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    print(response.statusCode);
    print(body);
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('fetchUsers completed');
  }
}
