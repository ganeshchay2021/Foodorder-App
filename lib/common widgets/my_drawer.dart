// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodorderapp/common%20widgets/my_drawer_tiles.dart';
import 'package:foodorderapp/pages/settings%20page/ui/settings_page.dart';
import 'package:foodorderapp/services/auth/auth_services.dart';
import 'package:foodorderapp/services/auth/login_or_register.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    void logout() async {
      final authService = AuthService();

      await authService.signOut();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginOrRegister(),
          ));
    }

    return Drawer(
      width: width * 0.7,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset("assets/icons/file.png", height: height * .2,)
          ),

          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //Home List tile
          MyDrawerTiles(
            icon: Icons.home,
            text: "H O M E",
            onTap: () {
              Navigator.pop(context);
            },
          ),

          //Setting List tile
          MyDrawerTiles(
            icon: Icons.settings,
            text: "S E T T I N G S",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          const Spacer(),

          //Logout List tile
          MyDrawerTiles(
            icon: Icons.logout,
            text: "L O G O U T",
            onTap: () {
              logout();
            },
          ),

          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
