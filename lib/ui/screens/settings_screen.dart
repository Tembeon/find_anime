import 'package:find_anime/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () {
                var box = Hive.box('settings');
                if (Get.isDarkMode) {
                  box.put('selectedTheme', 'light');
                  Get.changeTheme(themeData(context));
                } else {
                  box.put('selectedTheme', 'dark');
                  Get.changeTheme(darkThemeData(context));
                }
              },
              leading: Container(
                height: double.infinity,
                child: Icon(
                  Get.isDarkMode
                      ? Icons.brightness_5_outlined
                      : Icons.nights_stay_outlined,
                  size: 32,
                  color: Theme.of(context).accentColor,
                ),
              ),
              title: Text('Theme'),
              subtitle: Text('Change application theme'),
            ),
            Divider(),
            ListTile(
              onTap: () {
                launch('https://t.me/Tembeon');
              },
              title: Text('App developer'),
              subtitle: Text('Open Telegram contact'),
            ),
            ListTile(
              onTap: () {
                launch('https://trace.moe/about');
              },
              title: Text('Backend developer'),
              subtitle: Text('Open site'),
            ),
            ListTile(
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationName: 'FindAnime',
                  applicationVersion: 'by Tembeon',
                  applicationLegalese: 'visit tem-apps.web.app for more apps',
                );
              },
              title: Text('Licenses'),
              subtitle: Text('See open source licenses'),
            ),
          ],
        ));
  }
}
