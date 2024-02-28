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
  double progress = 0.0;

  Future<bool> updateProgress(bool isLiked) async{
    setState(() {
      progress += 0.25;
      if (progress > 1.0) {
        progress = 0.0;
      }
    }
    );
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Progress Indicator'),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left:2.0),
                child: ChainLinkProgressIndicator(progress: progress),
              ),
            ),
            SizedBox(height: 20),
            //ElevatedButton(onPressed: updateProgress, child: Text('Click Me')),
            LikeButton(
              size: 80,
              onTap: updateProgress,
              bubblesColor:BubblesColor(
                dotPrimaryColor: Colors.blueAccent,
                dotSecondaryColor: Colors.lightBlueAccent,
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 80,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChainLinkProgressIndicator extends StatelessWidget {
  final double progress;

  ChainLinkProgressIndicator({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          for (int i = 0; i < 8; i++)
            Row(
              children: [
                ChainLink(
                  filled: i < (progress * 8).floor(),
                ),
                OvalSpacer(
                  filled: i < (progress * 8).floor(),
                  visible: i < 7,

                )
              ],
            ),
        ],
      ),
    );
  }
}

class OvalSpacer extends StatelessWidget {
  final bool visible;
  final bool filled;

  OvalSpacer({required this.visible, required this.filled});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        width: MediaQuery.of(context).size.width / 32 ,
        height: 10,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          curve: Curves.linear,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: filled ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}


class ChainLink extends StatelessWidget {
  final bool filled;

  ChainLink({required this.filled});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 10.4,
      height: 20,
      //margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.transparent, // Make the outer part transparent
      ),
      child: Stack(
        children: [
          // Outer part with rounded corners
          AnimatedContainer(
            duration: Duration(milliseconds: 150),
            curve: Curves.linear,
            width: MediaQuery.sizeOf(context).width / 10.4,
            height: 20,
            decoration: BoxDecoration(
              color: filled ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Inner part to make the center transparent
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              curve: Curves.linear,
              width: (MediaQuery.sizeOf(context).width / 10.4) - 10,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

