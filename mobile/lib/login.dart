import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onSuccess;
  const LoginPage({Key? key, required this.onSuccess}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showError = false;

  void checkCredentials() {
    String username = usernameController.text;
    String password = passwordController.text;
    if (username == 'abdusalom' && password == 'freedom') {
      widget.onSuccess();
    }
    if (username == 'YaqubAliy' && password == 'mahbubiy571') {
      widget.onSuccess();
    } else {
      setState(() {
        showError = true;
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBDC2BC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Admin Login",
            style: TextStyle(
              fontSize: 58,
              color: Color.fromARGB(255, 244, 249, 242),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(color: Colors.white),
                fillColor:Color.fromARGB(255, 68, 122, 155),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Color.fromARGB(255, 68, 122, 155),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 42),
          GestureDetector(
            onTap: checkCredentials,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color:Color.fromARGB(255, 68, 122, 155),
              ),
              height: 60,
              alignment: Alignment.center,
              width: 200,
              child: Text("Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
          ),
          SizedBox(height: 20),
          if (showError)
            Text(
              "Incorrect username or password",
              style: TextStyle(
                color: Color(0xFF670D35),
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}



