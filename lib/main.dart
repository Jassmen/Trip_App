import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/fade_animation.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     PageController _pageController;

     void _onScroll(){
       print("hhh");
     }

     void initState(){
       _pageController =PageController(
         initialPage: 1,
       )..addListener(_onScroll);
       
     }
    

    return Scaffold(
      body: PageView(
        children: <Widget>[
          makePage(
              page: 1,
              image: 'assets/images/one.jpg',
              title: 'Yosemite National Park',
              description: 'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.'
          ),
          makePage(
              page: 2,
              image: 'assets/images/two.jpg',
              title: 'Golden Gate Bridge',
              description: 'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.'
          ),
          makePage(
              page: 3,
              image: 'assets/images/three.jpg',
              title: 'Sedona',
              description: "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful."
          ),
          makePage(
              page: 4,
              image: 'assets/images/four.jpg',
              title: 'Savannah',
              description: "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."
          ),

        ],
      ),
    );
  }

  Widget makePage({String image,String title,String description,int page}){
    int totalPage=4;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [.3,.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ],
          )
        ),
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                FadeAnimation(2,Text(page.toString(),style:TextStyle(fontSize: 30,color:Colors.white,fontWeight: FontWeight.bold))),
                Text('/'+totalPage.toString(),style:TextStyle(fontSize:15,color:Colors.white,)),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1, Text(title,style:TextStyle(fontSize: 50,color:Colors.white,fontWeight: FontWeight.bold))),
                    SizedBox(height:20),
                    FadeAnimation(1.5,Row(children: <Widget>[
                   Container(
                     margin: EdgeInsets.only(right:3),
                     child: Icon(Icons.star,color:Colors.yellow,size:30),),
                   Container(
                     margin: EdgeInsets.only(right:3),
                     child: Icon(Icons.star,color:Colors.yellow,size:30),),
                   Container(
                     margin: EdgeInsets.only(right:3),
                     child: Icon(Icons.star,color:Colors.yellow,size:30),),
                   Container(
                     margin: EdgeInsets.only(right:3),
                     child: Icon(Icons.star,color:Colors.yellow,size:30),),
                   Container(
                     margin: EdgeInsets.only(right:3),
                     child: Icon(Icons.star,color:Colors.grey,size:30),),
                   Text('4.0',style: TextStyle(color: Colors.white70,fontSize: 30),),
                   Text('(2300)',style: TextStyle(color: Colors.white70,fontSize: 15),),
                 ],)),
                    FadeAnimation(2,Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),)),
                  ),
                    SizedBox(height: 20,),
                    FadeAnimation(2.5,Text('READ MORE', style: TextStyle(color: Colors.white),)),
                    SizedBox(height: 30,),

            ],
                ),
              )
            ],
          ),
        ),
      ),

      );
}
}
