import 'package:flutter/cupertino.dart';
class CompanyListModel{

  int id;
  var companyName;
  var addedDate;
  List<String> companyWebsite = new List();

  //this listedWebsite array used for passing argument
  List<String> listedWebsite;

  //danger = true (unauthorize by BNM)
  var isDanger;



  //This constructor used for Model
  CompanyListModel.forModel();

  //Constructor overloading in dart. you cant have redundant constructor same name like java :)
  //This constructor used for pass argument to other activity
  CompanyListModel.forPassArgs(this.id,this.companyName,this.addedDate,this.listedWebsite,this.isDanger);





}
