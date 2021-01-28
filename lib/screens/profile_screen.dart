import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: ClipOval(
              child: Image.asset(
                'assets/profile_picture.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: Text('Adiwinoto Saptorenggo')
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              child: Text(
                'adiwinotosaptorenggo@gmail.com',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: InkWell(
                    child: Image.asset(
                      'assets/github_icon.png',
                      height: 50,
                      width: 50,
                    ),
                    onTap: () => launch('https://github.com/adisaptorenggo')
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  child: InkWell(
                    child: Image.asset(
                      'assets/linkedin_icon.png',
                      height: 40,
                      width: 40,
                    ),
                    onTap: () => launch('https://www.linkedin.com/in/adiwinoto-saptorenggo-0852b4a4')
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}