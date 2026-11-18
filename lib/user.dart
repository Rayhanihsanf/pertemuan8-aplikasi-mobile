import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  final User user;

  const UserInfoScreen({Key? key, required this.user}) : super(key: key);

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard User'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Logout',
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3), // ketebalan jarak garis
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue, // warna garis
                    width: 3, // ketebalan garis
                  ),
                ),
               
              ),
              const SizedBox(height: 16),
              const Text(
                'Rayhan Ihsan Fadhilah',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),const Text(
                '1126180062 | Teknik Informatika',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
                const SizedBox(height: 24),
              const Text(
                'Login Berhasil!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('UID: ${user.uid}', 
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Email: ${user.email ?? "Tidak ada email"}'),
                      const SizedBox(height: 8),
                      Text('Email Terverifikasi: ${user.emailVerified ? "Ya" : "Tidak"}'),
                      const SizedBox(height: 8),
                      Text('Terakhir Login: ${user.metadata.lastSignInTime.toString()}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}