import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLiked1 = false;
  bool isLiked2 = false;
  bool isLiked3 = false;
  double progress = 0.0;
  int likeCounter = 0;
  bool isVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Progress Indicator'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RotatedBox(//progress bar
                  quarterTurns: 3,
                  child: LinearProgressIndicator(
                    value: progress,
                  )
              ),
            ),
            LikeButton(
              size: 30,
              isLiked: isLiked1,
              likeBuilder: (isLiked){
                final color = isLiked1 ? Colors.blue : Colors.grey;
                return Icon(Icons.spa, color: color, size: 30,);
              },
              onTap: (isLiked) async{
                isLiked1 = !isLiked1;
                progress += isLiked1 ? .333333 : -.333333;
                likeCounter += isLiked1 ? 1 : -1;
                if(likeCounter != 0){
                  isVisible = true;
                }
                else{
                  isVisible = false;
                }

                Future.delayed(Duration(milliseconds: 10)).then((value) => setState(() {}));

                return !isLiked;
              },
            ),
            LikeButton(
              size: 30,
              isLiked: isLiked2,
              likeBuilder: (isLiked){
                final color = isLiked2 ? Colors.blue : Colors.grey;
                return Icon(Icons.spa, color: color, size: 30,);
              },
              onTap: (isLiked) async{
                isLiked2 = !isLiked2;
                progress += isLiked2 ? .333333 : -.333333;
                likeCounter += isLiked2 ? 1 : -1;
                if(likeCounter != 0){
                  isVisible = true;
                }
                else{
                  isVisible = false;
                }

                Future.delayed(Duration(milliseconds: 10)).then((value) => setState(() {}));

                return !isLiked;
              },
            ),
            LikeButton(
              size: 30,
              isLiked: isLiked3,
              likeBuilder: (isLiked){
                final color = isLiked3 ? Colors.blue : Colors.grey;
                return Icon(Icons.spa, color: color, size: 30,);
              },
              onTap: (isLiked) async{
                isLiked3 = !isLiked3;
                progress += isLiked3 ? .333333 : -.333333;
                likeCounter += isLiked3 ? 1 : -1;
                if(likeCounter != 0){
                  isVisible = true;
                }
                else{
                  isVisible = false;
                }

                Future.delayed(Duration(milliseconds: 10)).then((value) => setState(() {}));

                return !isLiked;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(likeCounter.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: isVisible,
                child: Text("See Profile")
              ),
            ),
          ],
        ),
      ),
    );
  }
}