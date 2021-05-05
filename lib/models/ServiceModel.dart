import 'package:flutter/material.dart';

class Services{
  final int id;
  final String sname,image;

  Services({this.id,this.sname,this.image});
}


List<Services> services=[
  Services(
    id: 1,
    sname: "Photography",
    image:"https://www.adobe.com/content/dam/cc/us/en/creative-cloud/photography/discover/dslr-camera/desktop/DSLR_P1_900x420.jpg.img.jpg"
  ),
  Services(
    id: 2,
    sname: "Salon Service",
    image: "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2020/05/salon-lockdown-1590854316.jpg"

  ),
  Services(
    id: 3,
    sname: "Flower",
    image: "https://image.shutterstock.com/image-photo/street-flower-shop-colourful-flowers-260nw-366541223.jpg"
  ),
  Services(
      id: 4,
      sname: "Interior Design",
      image: "https://i.pinimg.com/originals/5d/2e/dd/5d2edd23f75683399970a462cf06c902.jpg"

  ),
  Services(
      id: 5,
      sname: "Pets Care",
      image: "https://ichef.bbci.co.uk/news/976/cpsprodpb/BAF5/production/_111516874_gettyimages-451627799-1.jpg"

  ),
  Services(
      id: 6,
      sname: "Product photography",
      image: "https://res.cloudinary.com/www-ankitnandwani-in/image/upload/f_auto,q_auto:best/w_600,h_400,c_fill,g_auto/v1595862896/0O1A2632.jpg"

  ),
];