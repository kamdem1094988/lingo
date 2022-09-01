import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/choose_lang.dart';
import '../../services/firebase_auth_methods.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {

    void signOut() async {
      context.read<FirebaseAuthMethods>().signOut(context);
    }

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Lingo'),
          ),
          ListTile(
            leading: const Icon(Icons.backup),
            title: const Text('Backup'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text('Revisions'),
            onTap: () => {}
          ),
          const Spacer(),
          ListTile(
            title: const Text('Logout'),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    signOut();
                  });
                },
                icon: const Icon(Icons.logout)
            ),
          ),
        ],
      ),
    );
  }
}
