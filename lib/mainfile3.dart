import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MainFile3 extends StatefulWidget {
  const MainFile3({Key? key}) : super(key: key);

  @override
  State<MainFile3> createState() => _MainFile3State();
}

class _MainFile3State extends State<MainFile3> {
  final _formkey=GlobalKey<FormState>();
  final _imagecontroller=TextEditingController();
  final _name=TextEditingController();
  final _price=TextEditingController();
  final _time=TextEditingController();
  bool _isLoading=false;
  Future<void>_addData()async{
    setState(() {
      _isLoading=true;
    });

  final apiUrl='https://63fed413571200b7b7d074f5.mockapi.io/travel';
  final response=await http.post(Uri.parse(apiUrl),body:{
    'avatar':_imagecontroller.text,
    'name':_name.text,
    'price':_price.text,
    'time':_time.text,
  });
  if(response.statusCode==201)
    {
      Navigator.pop(context,true);
    }
  else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add data')),);
  }
  setState(() {
    _isLoading=false;
  });
  }
  @override
  void dispose(){
    _imagecontroller.dispose();
    _name.dispose();
    _time.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                controller: _imagecontroller,
                decoration: InputDecoration(labelText: 'Image url'),
                validator: (value) {
                  if(value!.isEmpty)
                    {
                      return 'Image url is required';
                    }
                  return null;
                },
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if(value!.isEmpty)
                  {
                    return 'NAme is required';
                  }
                return null;
              },
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: _time,
              decoration: InputDecoration(labelText: 'time'),
              validator: (value) {
                if(value!.isEmpty)
                {
                  return 'time is required';
                }
                return null;
              },
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: _price,
              decoration: InputDecoration(labelText: 'price'),
              validator: (value) {
                if(value!.isEmpty)
                {
                  return 'price is required';
                }
                return null;
              },
            ),
            SizedBox(height: 32,),
            ElevatedButton(onPressed: _isLoading ? null :(){
                if(_formkey.currentState!.validate()){
                  _addData();
                }
            }, child: _isLoading ? CircularProgressIndicator():Text('Add data')),
          ],
        ),
      ),
    ),);

  }
}
