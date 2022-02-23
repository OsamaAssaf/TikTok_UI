import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktokui/view_models/home_view_model.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:marquee/marquee.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();

  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0);
  }
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 3500), (timer) {
      _changeRotation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = Provider.of<HomeViewModel>(context).selectedIndex;
    bool _isForYouSelected = Provider.of<HomeViewModel>(context).isForYouSelected;
    bool _isFavorite = Provider.of<HomeViewModel>(context).isFavorite;
    bool _isFollowed = Provider.of<HomeViewModel>(context).isFollowed;
    String _username = Provider.of<HomeViewModel>(context).username;
    String _description = Provider.of<HomeViewModel>(context).description;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.network(
                  'https://i.pinimg.com/564x/01/88/dc/0188dc41881e0e410b5375cdead5f49a.jpg',
                  fit: BoxFit.fitHeight,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Positioned(
                  top: 32.0,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Provider.of<HomeViewModel>(context,listen: false).changeForYouSelected(false);
                        },
                        child: Text('Following',style: TextStyle(
                          color: _isForYouSelected?Colors.grey:Colors.white,
                          fontSize: _isForYouSelected?16:18,
                        )),
                      ),
                      const SizedBox(width: 8.0,),
                      Container(width: 1.0,height: 5.0,color: Colors.grey,),
                      const SizedBox(width: 8.0,),
                      GestureDetector(
                        onTap: (){
                          Provider.of<HomeViewModel>(context,listen: false).changeForYouSelected(true);
                        },
                        child: Text('For You',style: TextStyle(
                          color: !_isForYouSelected?Colors.grey:Colors.white,
                          fontSize: !_isForYouSelected?16:18,
                        )),
                      ),

                    ],
                  ),
                ),
                Positioned(
                  top: 32.0,
                  right: 16.0,
                  child: IconButton(
                    onPressed: (){},
                    icon:const Icon(Icons.search,color: Colors.white,size: 30,),
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25.0,
                          ),
                          const CircleAvatar(
                            backgroundImage: NetworkImage('https://bestprofilepictures.com/wp-content/uploads/2021/04/Cool-Profile-Picture.jpg'),
                            radius: 23.0,
                          ),
                          Visibility(
                            visible: !_isFollowed?true:false,
                            child:  Positioned(
                              bottom: -10,
                              child: GestureDetector(
                                child:const CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.add,color: Colors.white,size: 15,),
                                ),
                                onTap: (){
                                  Provider.of<HomeViewModel>(context,listen: false).follow();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0,),
                      Column(
                        children: [
                          GestureDetector(
                            child: Icon(Icons.favorite,size: 40.0,color: _isFavorite?Colors.red:Colors.white,),
                            onTap: (){
                              Provider.of<HomeViewModel>(context,listen: false).changeFavorite();
                            },
                          ),
                          const Text('175.9k',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      const SizedBox(height: 16.0,),
                      Column(
                        children: [
                          GestureDetector(
                            child:const Icon(Icons.comment,size: 40.0,color: Colors.white,),
                            onTap: (){
                            },
                          ),
                          const Text('3016',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      const SizedBox(height: 16.0,),
                      Column(
                        children: [
                          GestureDetector(
                            child:const Icon(Icons.share_outlined,size: 40.0,color: Colors.white,),
                            onTap: (){
                              _changeRotation();
                            },
                          ),
                          const Text('4027',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      const SizedBox(height: 16.0,),
                      const SizedBox(height: 48.0,),
                      AnimatedRotation(
                        turns: turns,
                        duration: const Duration(seconds: 4),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: const[
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 25.0,
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://bestprofilepictures.com/wp-content/uploads/2021/04/Cool-Profile-Picture.jpg'),
                              radius: 15.0,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                  left: 16.0,
                  bottom: 32.0,
                  child: DefaultTextStyle(
                    style:const TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_username),
                        const SizedBox(height: 16.0,),
                        SizedBox(child: Text(_description,textAlign: TextAlign.left,maxLines: 3,),width: width * 0.75,),
                        const SizedBox(height: 16.0,),
                        const Text('See transition',style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 16.0,),
                        Row(
                          children: [
                            const Icon(Icons.surround_sound,color: Colors.white,),
                            const SizedBox(width: 8.0,),
                            SizedBox(
                              width: width * 0.4,
                              height: 20.0,
                              child: Marquee(
                                text: 'There once was a boy who told this story about a boy: ',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: (int index){
          Provider.of<HomeViewModel>(context,listen: false).changeBottomBarIndex(index);
        },
        currentIndex: _selectedIndex,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Typicons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Typicons.compass),label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box,color: Colors.white,),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.indeterminate_check_box_outlined),label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Profile'),
        ],

      ),
    );
  }
}
