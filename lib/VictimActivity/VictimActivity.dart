
import 'package:flutter/material.dart';
import 'package:izitscam/FaqActivity/FaqContent.dart';
import 'package:izitscam/util/AppsTheme.dart';
import 'package:izitscam/VictimActivity/Datautilits.dart';





//Create the instance of List for Data Model

//Start Here To Edit the images and titles and description
List<Datautilits> dataUtilits = [
  Datautilits('Step One',FaqContent.faq7Content1,'lib/img/report/step1_1.jpg'),
  Datautilits('Step Two',FaqContent.faq7Content2,'lib/img/report/step2_2edited.png'),
  Datautilits('Step Three',FaqContent.faq7Content3,'lib/img/report/step3_1.png'),
  Datautilits('Step Four',FaqContent.faq7Content4,'lib/img/report/step4_1.png'),
];

class VictimActivityState extends StatefulWidget{
  static const routeName = '/VictimActivity';
  @override
  createState() => VictimActivity();
}

AppsTheme appstheme = AppsTheme();

class VictimActivity extends State<VictimActivityState> {
  int currentIndex = 0;
  bool _reachatend;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: 0,
    );

    super.initState();
  }
  

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    //Start To create the slider with pageView
    return Column(

      children: <Widget>[

        Flexible(
          child: PageView.builder(
              physics: ClampingScrollPhysics(),

              itemCount: dataUtilits.length,
              controller: _pageController,
              onPageChanged: (index){

                if (index == (dataUtilits.length - 1)) {
                  setState(() {
                    _reachatend = true;
                    currentIndex = index;

                  });
                } else {
                  setState(() {
                    _reachatend = false;
                    currentIndex = index;

                  });
                }

              },
              itemBuilder: (context,index) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  body: Center(
                    child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.
                      children: <Widget>[
                        Container (
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage(dataUtilits[index].image),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(height: 40.0,width: 300,),
                        Text(dataUtilits[index].title,style:appstheme.titleStyle ),
                        Container(height: 50.0,width: 300,),
                        Padding(
                          padding: const EdgeInsets.only(right:20.0,left: 20),
                          child: Text(dataUtilits[index].description,style: appstheme.deccriptionStyle,textAlign: TextAlign.center,),
                        ),

                      ],



                    ),
                  ),
                );

              }),
        ),
        Transform.translate(
          offset: Offset(0,MediaQuery.of(context).size.height * - 0.15),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _drawDots(dataUtilits.length),
            ),
          ),
        ),
      ],
    );



  }

  List<Widget> _drawDots(int quatity) {
    List<Widget> widgets = [];
    for(int index = 0; index < quatity ; index++){
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 20,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: (index == currentIndex ) ? AppsTheme.theme1 : Colors.grey,

            ),
          ),
        ),

      );
    }
    return widgets;
  }
}