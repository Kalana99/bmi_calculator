import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: mainHexColor,
      
      appBar: AppBar(

        title: Text(
          'BMI Calculator',

          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
          ),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        child: Column(

          children: [

            SizedBox(height: 20.0),

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                Container(

                  width: 130.0,

                  child: TextField(

                    controller: _heightController,

                    style: TextStyle(
                      fontSize: 42.0,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),

                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(

                      border: InputBorder.none,

                      hintText: 'Height(m)',

                      hintStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )

                    ),
                  ),
                ),

                Container(

                  width: 130.0,

                  child: TextField(

                    controller: _weightController,

                    style: TextStyle(
                      fontSize: 42.0,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),

                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(

                      border: InputBorder.none,
                      
                      hintText: 'Weight(kg)',

                      hintStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )

                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0),

            GestureDetector(

              onTap: () {

                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                setState(() {

                  _bmiResult = _w / pow(_h, 2);

                  if(_bmiResult > 25){
                    _textResult = "You're over weight";
                  }
                  else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "You have normal weight";
                  }
                  else{
                    _textResult = "You're under weight";
                  }
                });
              },

              child: Text(

                'Calculate',

                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),

            SizedBox(height: 20.0),

            Container(

              child: Text(

                _bmiResult.toStringAsFixed(2),

                style: TextStyle(
                  fontSize: 90.0,
                  color: accentHexColor,
                ),
              ),
            ),

            SizedBox(height: 30.0),

            Visibility(

              visible: _textResult.isNotEmpty,

              child: Container(
            
                child: Text(
            
                  _textResult,
            
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),

            //left bars
            SizedBox(height: 10.0),

            LeftBar(barWidth: 40.0),

            SizedBox(height: 20.0),

            LeftBar(barWidth: 70.0),

            SizedBox(height: 20.0),

            LeftBar(barWidth: 40.0),

            //right bars
            SizedBox(height: 20.0),

            RightBar(barWidth: 70.0),

            SizedBox(height: 50.0),

            RightBar(barWidth: 70.0),
          ],
        ),
      ),
    );
  }
}