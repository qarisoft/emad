// onboarding models
// import 'package:emad_app/app/extensions.dart';

import 'package:emad_app/data/data_source/db/models.dart';

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

// login models

class User {
  // String name;
  String email;

  User(this.email);
}

class HomeObject {
  List<Product> products;

  HomeObject(this.products);
}
class ProductObject {
  List<Product> products;

  ProductObject(this.products);
}
