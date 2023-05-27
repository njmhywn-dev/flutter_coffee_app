import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';

class User_Screen extends StatefulWidget {
  User_Screen({super.key});

  @override
  State<User_Screen> createState() => _User_ScreenState();
}

final TextEditingController _addressTextController =
    TextEditingController(text: (''));

class _User_ScreenState extends State<User_Screen> {
  @override
  void dispose() {
    //_addressTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      //appBar: AppBar(title: Text('++++'),backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 35),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Hi, ',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'MyName',
                      style: TextStyle(
                        color: color,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('My name is pressed');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextWidget(text: 'test@email.com', color: color, textSize: 16),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 3,
              ),
              _ListTileUsuer(
                title: 'Address',
                subtitle: 'My address',
                icon: IconlyLight.profile,
                color: color,
                onPress: () async {
                  await _showAddressDialog();
                },
              ),
              _ListTileUsuer(
                title: 'Orders',
                subtitle: '',
                icon: IconlyLight.bag2,
                color: color,
                onPress: () {},
              ),
              _ListTileUsuer(
                title: 'Wishlist',
                subtitle: '',
                icon: IconlyLight.heart,
                color: color,
                onPress: () {},
              ),
              _ListTileUsuer(
                title: 'Viewed',
                subtitle: '',
                icon: IconlyLight.show,
                color: color,
                onPress: () {},
              ),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? 'Dark Theme' : 'Light Theme',
                  color: color,
                  textSize: 22,
                  isTitle: true,
                ),
                subtitle: Text(''),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
              _ListTileUsuer(
                title: 'Forget Password',
                subtitle: '',
                icon: IconlyLight.unlock,
                color: color,
                onPress: () {},
              ),
              _ListTileUsuer(
                title: 'Logout',
                subtitle: '',
                icon: IconlyLight.logout,
                color: color,
                onPress: () async {
                  await _showLogoutDialog();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Text('Update address'),
            ]),
            content: TextField(
              maxLines: 5,
              onChanged: (value) {
                //_addressTextController.text;
              },
              controller: _addressTextController,
              decoration: InputDecoration(hintText: 'Your address'),
            ),
            actions: [
              TextButton(onPressed: () {
                if(Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              }, child: TextWidget(text: 'Cancel', color: Colors.redAccent, textSize: 16)),
              TextButton(onPressed: () {}, child: TextWidget(text: 'Update', color: Colors.cyan, textSize: 16)),
            ],
          );
        });
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(IconlyLight.dangerCircle),
                SizedBox(
                  width: 15,
                ),
                Text('Sign out')
              ],
            ),
            content: Text('Do you want to sign out'),
            actions: [
              TextButton(
                onPressed: () {
                  if(Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  text: 'Cancel',
                  color: Colors.cyan,
                  textSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  text: 'Ok',
                  color: Colors.redAccent,
                  textSize: 16,
                ),
              ),
            ],
          );
        });
  }
}

Widget _ListTileUsuer({
  required String title,
  String? subtitle,
  required IconData icon,
  required Function() onPress,
  required Color color,
}) {
  return ListTile(
      title: TextWidget(
        text: title,
        textSize: 22,
        color: color,
        isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? '' : subtitle,
        textSize: 18,
        color: color,
      ),
      leading: Icon(icon),
      trailing: Icon(IconlyLight.arrowRight2),
      onTap: onPress);
}
