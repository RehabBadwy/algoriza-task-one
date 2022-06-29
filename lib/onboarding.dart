import 'package:flutter/material.dart';
import 'package:task_one/login.dart';
import 'package:task_one/onboarding_content.dart';

class OnBoarding extends StatefulWidget {
  static const String routeName = 'onBoarding';

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  int currentIndex = 0;
  PageController? controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: (){},
              child: Text('Skip',
              style: TextStyle(
                color: Colors.teal
              ),
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('7',
                  style: TextStyle(
                      fontSize: 30,
                    color: Colors.orange,
                  ),
                ),
                Text('Krave',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.teal
                ),
                )
              ],
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index){
                    setState(() {
                      currentIndex =index;
                    });
                  },
                  itemCount: contents.length,
                  itemBuilder: (BuildContext,index){
                    return Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Image.asset(contents[index].image,
                            fit: BoxFit.fill,
                            height: 200,
                          ),
                          Text(contents[index].title,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(contents[index].discription,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            contents.length,
                                (index) => AnimatedContainer(
                              margin: const EdgeInsets.only(right: 5),
                              duration: const Duration(milliseconds: 900),
                              width: (index == currentIndex)?20:10,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: (index == currentIndex)?Colors.teal : Colors.grey,
                                  borderRadius: BorderRadius.circular(10),

                              ),
                            ))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      height: 40,
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 0),
                        onPressed: (){
                            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        },
                        textColor: Colors.white,
                        child: Text('Get Started'),
                        color: Colors.teal,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an Account',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                          },
                          child: Text('Sign Up',
                            style: TextStyle(
                                color: Colors.teal
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
            ),
          ],
        )
      ),
    );
  }
}
//smothIndecator(
//controller:controller
// conut : content.lenght