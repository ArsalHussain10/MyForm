import 'package:flutter/material.dart';

const kLabelTextStyle=TextStyle(
  fontSize: 26,

);

const kInputTextStyle=TextStyle(
  fontStyle: FontStyle.italic,
  fontSize: 19,
  color: Colors.white,

);

class FormData extends StatelessWidget {
  String firstName,lastName,email,phone;
  FormData({this.firstName,this.lastName,this.email,this.phone});

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Information"),
          ),
          backgroundColor: Colors.lightBlue,
          body: SafeArea(
            child: Padding(

              padding: const EdgeInsets.only(top: 150,left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Information(label: 'First Name',info: firstName),
            Divider(
              color: Colors.white,
            ),
            SizedBox(height: 20,),
           Information(label: 'Last Name', info: lastName),
                  Divider(              color: Colors.white,
                  ),
                  SizedBox(height: 20,),


                  Information(label: 'Email', info: email),
                  Divider(              color: Colors.white,
                  ),
                  SizedBox(height: 20,),

                  Information(label: 'Phone Number', info: phone),
                  Divider(              color: Colors.white,
                  ),


                ],
              ),
            ),
          )
        );

  }
}

class Information extends StatelessWidget {


  final String info;
  final String label;
  Information({@required this.label, @required this.info });


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text('$label : ',style: kLabelTextStyle,),
        Text(info,style: kInputTextStyle,),
      ],
    );
  }
}