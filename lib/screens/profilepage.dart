import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.network(
                      'https://wallpaperaccess.com/full/3915815.jpg',
                      fit: BoxFit.cover),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 8.0,
                  child: Container(
                    height: 170.0,
                    width: 120.0,
                    child: Image.network(
                      'https://media.istockphoto.com/vectors/male-user-icon-vector-id517998264?k=20&m=517998264&s=612x612&w=0&h=pdEwtkJlZsIoYBVeO2Bo4jJN6lxOuifgjaH8uMIaHTU=',
                    ),
                  ),
                ),
                const Positioned(
                  left: 160,
                  bottom: 60,
                  child: Text(
                    'You',
                    style: TextStyle(
                      fontSize: 22.0,fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            const ListTile(
              leading: Icon(
                Icons.inbox,
                color: Colors.grey,
              ),
              title: Text(
                'Orders',
                style: TextStyle(color: Colors.black45),
              ),
              subtitle: Text(
                'Check your order status',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              title: Text(
                'Wishlist',
                style: TextStyle(color: Colors.black45),
              ),
              subtitle: Text(
                'Check your wishlist',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: Text(
                'Setting',
                style: TextStyle(color: Colors.black45),
              ),
              subtitle: Text(
                'Manage notification and app settings',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ),
            Divider(
              thickness: 8.0,
              color: Colors.grey.shade700,
            ),
            const ListTile(
              leading: Icon(
                Icons.inbox,
                color: Colors.grey,
              ),
              title: Text(
                'Orders',
                style: TextStyle(color: Colors.black45),
              ),
              subtitle: Text(
                'Check your order status',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              title: Text(
                'Wishlist',
                style: TextStyle(color: Colors.black45),
              ),
              subtitle: Text(
                'Check your wishlist',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: Text(
                'Setting',
                style: TextStyle(color: Colors.black45),
              ),
              subtitle: Text(
                'Manage notification and app settings',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ),
          ],
        )));
  }
}
