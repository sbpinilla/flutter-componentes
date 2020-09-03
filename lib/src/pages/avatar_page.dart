import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final nombrePagina = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Avatares'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/the-batman-noventa-90-matt-reeves-1552916303.jpg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/the-batman-noventa-90-matt-reeves-1552916303.jpg'),
        ),
      ),
    );
  }
}
