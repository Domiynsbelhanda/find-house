
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> urlLaunch(String urls) async{
  final Uri _url = Uri.parse(urls);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> whatsappCall(String phone) async{
  String message = "Bonjour Place Event";
  late String url;
  if (Platform.isAndroid) {
    // add the [https]
    url = "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
  } else {
    // add the [https]
    url = "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
  }
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}