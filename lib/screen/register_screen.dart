import 'package:catatan_apps/screen/login_screen.dart';
import 'package:catatan_apps/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuthServices fbServices = FirebaseAuthServices();

  register() async {
    fbServices
        .registerAkun(
            username: usernameController.text,
            alamat: alamatController.text,
            email: emailController.text,
            password: passwordController.text)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${value?.user?.email} success register'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.teal.shade600, Colors.teal.shade900])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Registrasi Akun Anda !',
              style: TextStyle(
                fontSize: 25,
                height: 2,
                fontStyle: FontStyle.italic,
                color: Colors.green.shade50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'username',
                hintText: 'masukkan username',
                prefixIcon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.yellow,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(
                labelText: 'alamat',
                hintText: 'masukkan alamat',
                prefixIcon: const Icon(
                  Icons.home_outlined,
                  color: Colors.pink,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
                hintText: 'masukkan email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.purple,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'masukkan password',
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.tealAccent,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                register();
              },
              child: Text('Register'),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Sudah punya akun? Logn disini'),
            ),
          ],
        ),
      ),
    );
  }
}
