import 'dart:async';

import 'package:data_product/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://w.wallhaven.cc/full/md/wallhaven-mdrk8k.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.all(16),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Color.fromARGB(255, 50, 49, 49),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: ClipOval(
                          child: Image.asset(
                            'Assets/katase-san.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const Text(
                      'Silahkan login terlebih dahulu',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        print('Username: $value');
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 35,
                        ),
                        hintText: "Masukkan Username",
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      onChanged: (value) {
                        print('Password: $value');
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 35,
                        ),
                        hintText: "Masukkan Password",
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Colors.green,
                      elevation: 5,
                      child: Container(
                        height: 50,
                        child: _loading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  setState(() {
                                    _loading = true;
                                  });

                                  String username = _usernameController.text;
                                  String password = _passwordController.text;

                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      _loading = false;
                                    });

                                    if (username.isNotEmpty &&
                                        password.isNotEmpty) {
                                      if (username.contains('@')) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DProduk(),
                                          ),
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content: const Text(
                                                  'Username harus mengandung karakter "@"!'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: const Text(
                                                'Username dan Password tidak boleh kosong!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  });
                                },
                                child: const Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
