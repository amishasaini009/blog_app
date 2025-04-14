import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const TestingPage());
  }

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  String resultMessage = "Waiting for result...";

  Future<void> _testSignUp() async {
    try {
      final result = await Supabase.instance.client.auth.signUp(
        email: 'sainiamisha4@gmail.com',
        password: 'password1234',
      );

      setState(() {
        resultMessage = result.user?.id ?? 'User is null';
      });
    } catch (e) {
      setState(() {
        resultMessage = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _testSignUp(); // Trigger it when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Testing Signup")),
      body: Center(child: Text(resultMessage)),
    );
  }
}
