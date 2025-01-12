import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 0)),
        useMaterial3: false,
      ),
      home: MyHomePage(title: "MyApp",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<StatefulWidget> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Tracker")),
      ),
      body: Container(
        color: bgColor ?? Colors.white,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("BMI", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),),
            
                SizedBox(
                  height: 21,
                ),
            
                TextField(
                 controller: wtController,
                 decoration: InputDecoration(
                  label: Text("Enter Your Weight"),
                  prefixIcon: Icon(Icons.line_weight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                 ),
                 keyboardType: TextInputType.number,
                ),
            
                SizedBox(
                  height: 21,
                ),
            
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter Your Height (in feet)"),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
            
                SizedBox(
                  height: 21,
                ),
            
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text("Enter Your Height (in inches)"),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
            
                SizedBox(
                  height: 21,
                ),
        
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
        
                  if(wt!="" && ft!="" && inch!=""){
                    //BMI calulation
        
                    var iWt = double.parse(wt);
                    var iFt = double.parse(ft);
                    var iInch = double.parse(inch);
        
                    var tInch = (iFt * 12) + iInch;   //1 ft = 12 inch
                    
                    var tCm = tInch * 2.54;           //1 inch = 2.54cm
                    
                    var tM = tCm / 100;               //1 m = 1cm/100 
                    
                    var bmi = iWt / (tM * tM);        //bmi = weight/(height)^2 in kd per meter square

                    var msg = "";

                    if(bmi > 25){
                      msg = "You're OverWeight!!";
                      bgColor = Colors.orange.shade200;
                    }else if(bmi < 18){
                      msg = "You're UnderWeight!!";
                      bgColor = Colors.red.shade200;
                    }else {
                      msg = "You're Healthy!!";
                      bgColor = Colors.green.shade200;
                    } 
        
                    setState(() {
                      result = "$msg \nYour BMI is : ${bmi.toStringAsFixed(4)}";
                    });
        
                  }else {
                    setState(() {
                      result = "*Please fill all the required blanks!!";
                    });
                  }
        
                }, child: Text("Calculate")),
        
                SizedBox(
                  height: 11,
                ),
        
                Text(result, style: TextStyle(fontSize: 19,color: Color.fromARGB(255, 19, 77, 124)),),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
