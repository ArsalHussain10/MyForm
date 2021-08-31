import 'package:flutter/material.dart';
import 'package:form/form_data.dart';


final nameController=TextEditingController();
final finalNameController=TextEditingController();

Color nameErrorColor=Colors.black12;
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final emailController=TextEditingController();
  Color emailErrorColor=Colors.black12;
  final phoneController=TextEditingController();

  Color phoneErrorColor=Colors.black12;
  bool emailFlag=false,phoneFlag=false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Contact Form'),

        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
          child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 10,),

                Row(children: [


                  NameField('First Name',nameController,nameErrorColor),
                  SizedBox(width: 5,),
                  NameField('Last Name',finalNameController,Colors.black12),
                ],),
                SizedBox(height: 10,),

                Text('Email',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 10,),

                TextField(
                  controller: emailController,

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    helperText: emailFlag?'Please provide email':' ',
                    helperStyle: TextStyle(color: Colors.red),

                    contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 7),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                      borderSide: BorderSide(
                          color: emailErrorColor
                      ),


                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: Colors.blue,

                      ),



                    ),
                    focusedErrorBorder : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: emailErrorColor,

                      ),



                    ),
                  ),


                ),
                SizedBox(height: 10,),

                Flexible(
                  child: Text('Phone',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(height: 10,),
                Flexible(
                  fit: FlexFit.loose,

                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      helperText: phoneFlag?'Please provide Phone Number':' ',
                      helperStyle: TextStyle(color: Colors.red),
                      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 7),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: phoneErrorColor,
                        ),


                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                          color: Colors.blue,

                        ),


                      ),
                    ),

                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: Material(
                        color: Colors.blue,
                        borderRadius: BorderRadiusDirectional.circular(10),
                        child: MaterialButton(
                          onPressed: () {
                            if (emailController.text==''||phoneController.text==''||nameController.text=='')
                            {
                              setState(() {
                                if(emailController.text=='') {
                                  emailErrorColor = Colors.red;
                                  emailFlag=true;
                                }
                                else
                                {
                                  setState(() {
                                    emailErrorColor=Colors.black12;
                                    emailFlag=false;
                                  });
                                }
                                if(phoneController.text=='')
                                {
                                  phoneErrorColor=Colors.red;
                                  phoneFlag=true;

                                }
                                else
                                {
                                  setState(() {
                                    phoneErrorColor=Colors.black12;
                                    phoneFlag=false;
                                  });
                                }
                                if(nameController.text=='')
                                {
                                  nameErrorColor=Colors.red;

                                }
                                else{
                                  setState(() {
                                    nameErrorColor=Colors.black12;
                                  });
                                }
                              });
                            }
                            else
                            {
                              setState(() {
                                emailErrorColor=Colors.black12;
                                phoneErrorColor=Colors.black12;
                                nameErrorColor=Colors.black12;
                                emailFlag=false;
                                phoneFlag=false;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>FormData(firstName: nameController.text,lastName: finalNameController.text,email: emailController.text,phone: phoneController.text, ))) ;
                            }
                          },
                          minWidth: 390,
                          child: Text('Save',
                            style: TextStyle(color: Colors.white,
                                fontSize: 20
                            ),),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

          ),
        )
    );
  }
}



class NameField extends StatelessWidget {

  String helperText;
  dynamic tempNameController;
  Color tempNameErrorColor;

  NameField(this.helperText,this.tempNameController,this.tempNameErrorColor);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: tempNameController ,
        cursorHeight: 5,
        cursorColor: Colors.black,

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),

          helperText: helperText,
          helperStyle: TextStyle(
            fontSize: 20,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: BorderSide(
                color: tempNameErrorColor
            ),


          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: Colors.blue,

            ),


          ),
        ),
      ),
    );
  }
}

