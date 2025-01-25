import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: const Image(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1717501218636-a390f9ac5957?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'MINDFRAME',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter your email and password',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Email',
                      labelText: "Email",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "password",
                      labelText: "password",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'REGISTER',
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        elevation: 20,
                        fixedSize: Size(120, 34)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot password?'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
