import 'package:flutter/material.dart';

class ReigsterPage extends StatefulWidget {
  const ReigsterPage({super.key});

  @override
  State<ReigsterPage> createState() => _ReigsterPageState();
}

class _ReigsterPageState extends State<ReigsterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordlController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
