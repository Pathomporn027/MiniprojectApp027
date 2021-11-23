import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/pages/model/condo_model.dart';

class CondoDetailPage extends StatefulWidget {
  @override
  _CondoDetailPageState createState() => _CondoDetailPageState();
}

class _CondoDetailPageState extends State<CondoDetailPage> {
  Condo _condoModel;
  double rating = 0;
  @override
  void initState() {
    _condoModel = Condo();
    super.initState();
  }

  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Condo) {
      _condoModel = arguments;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_condoModel.condoName),
        backgroundColor: Colors.blue.shade400,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240,
              child: Image.network(API.CONDO_IMAGE + _condoModel.condoImage),
            ),
            Text(
              'Name : ' + _condoModel.condoName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'รายละเอียด',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              _condoModel.condoLocation,style: TextStyle(
              fontSize: 15
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, AppRoute.videoRoute, arguments: _condoModel.id);
              },
              style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent.shade200),
              child: Text('จองห้องพัก'),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rating : $rating'
                    '',
                    style: TextStyle(fontSize: 15),
                  ),
                  RatingBar.builder(
                    minRating: 1,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    updateOnDrag: true,
                    onRatingUpdate: (rating) => setState(() {
                      this.rating = rating;
                    }),
                  ),
                  TextButton(
                    child: Text(
                      'Show Dialog',
                      style: TextStyle(fontSize: 15),
                    ),
                    //onPressed: () => showRating(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Comment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'comment..',
                prefixIcon: Icon(Icons.send),
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
