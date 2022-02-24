import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier{

  List<String> videosUrl = [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',

  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void changeBottomBarIndex(int index){
    if(index == 2){
      return;
    }
    _selectedIndex = index;
    notifyListeners();
  }

  bool _isForYouSelected = true;
  bool get isForYouSelected => _isForYouSelected;
  void changeForYouSelected(bool isForYou){
    _isForYouSelected = isForYou?true:false;
    notifyListeners();
  }

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;
  void changeFavorite(){
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  bool _isFollowed = false;
  bool get isFollowed => _isFollowed;
  void follow(){
    _isFollowed = true;
    notifyListeners();
  }

  final String _username = '@osama';
  String get username  => _username;

  final String _description = 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.';
  String get description  => _description;

}