import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final String email;
  final String bio;
  final String avatarUrl;

  UserProfile({
    required this.name,
    required this.email,
    required this.bio,
    required this.avatarUrl,
  });
}

class MeetingHistory extends StatelessWidget {
  final UserProfile userProfile = UserProfile(
    name: 'Agung Raviano',
    email: 'Siswa',
    bio:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan tristique tellus, eget consequat neque laoreet in.',
    avatarUrl: 'https://pin.it/jzVVXRL',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(userProfile.avatarUrl),
          ),
          SizedBox(height: 20),
          Text(
            userProfile.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            userProfile.email,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              userProfile.bio,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MeetingHistory()),
              );
            },
            child: Text('Lihat Profil'),
          ),
        ),
      ),
    );
  }
}

RaisedButton({required Null Function() onPressed, required Text child}) {
}

void main() {
  runApp(MyApp());
}
